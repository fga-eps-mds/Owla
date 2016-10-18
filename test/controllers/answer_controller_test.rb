require 'test_helper'

class AnswersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @member = Member.create(name: "Thalisson", alias: "thalisson", email: "thalisson@gmail.com", password: "12345678", password_confirmation: "12345678")
    @room = Room.new(name: "calculo 1", description: "teste1")
    @room.owner = @member;
    @room.save

    @topic = @room.topics.new(name: "limites", description: "description1")
    @topic.save

    @question = @topic.questions.new(content: "How did I get here?")
    @question.member = @member
    @question.save

    @answer = Answer.new(content: "CONTENT TEST")
    @answer.member = @member
    @answer.question = @question
    @answer.anonymous = false
    @answer.save

    sign_in_as @member
  end

   test "should create answer" do
     post question_answers_path(@question), params: {
       answer: {
         content: "Resposta da pergunta"
       }
     }
     assert_redirected_to topic_path(@question.topic)
   end

   test "should edit answer" do
     answer_id = @answer.id
     answer_content = @answer.content
     patch "/answers/#{answer_id}", params: {
       answer: { content: "verdadeira resposta da pergunta" }
     }

     @answer.reload

     assert_not_equal answer_content, @answer.content
   end

   test "should not edit answer when member is not logged in" do
    sign_out_as @member
    answer_id = @answer.id
    answer_content = @answer.content
    patch "/answers/#{answer_id}", params: {
      answer: { content: "verdadeira resposta da pergunta?" }
    }

    @answer.reload

    assert_equal answer_content, @answer.content
  end

  test "should delete answer" do
    assert_difference('Answer.count', -1) do
      delete "/answers/#{@answer.id}"
      assert_redirected_to question_answers_path(@question)
    end
  end

  test "should not delete the answer if user is not logged in" do
    sign_out_as @member
    delete "/answers/#{@answer.id}"
    assert_redirected_to root_path
  end

  test "Should appear as anonymous user if the member isn't the room owner" do
    @answer.anonymous = true
    answer_name = @answer.member.name
    member_id = 2

    if (@answer.anonymous && @room.owner != member_id)
      @answer.member.name = "Usuário anônimo"
    end
  end

  test "Should appear as anonymous user if the member isn't the answer owner" do
    @answer.anonymous = true
    answer_name = @answer.member.name
    member_id = 2

    if (@answer.anonymous && @answer.member.id != member_id)
      @answer.member.name = "Usuário anônimo"
    end
  end

  test "should appear as anonymous user when answer if the member isn't the room owner and the question owner" do
    @answer.anonymous = true
    member_id = 2
    answer_name = @answer.member.name

    if (@answer.anonymous && @room.owner.id != member_id && member_id != @answer.member.id)
      @answer.member.name = "Usuário Anônimo"
    end

    assert_not_equal answer_name, @answer.member.name
  end

  test "should not appear as anonymous user when answer if the member is the room owner" do
    answer_name = @answer.member.name

    if (@answer.anonymous && @room.owner.id != @member.id)
      @answer.member.name = "Usuário anônimo"
    end

    assert_equal answer_name, @answer.member.name
  end

  test "should not appear as anonymous user when answer if the member is the question owner" do
    answer_name = @answer.member.name

    if (@answer.anonymous && @room.owner.id != @member.id && @member.id != @answer.member.id)
      @answer.member.name = "Usuário anônimo"
    end

    assert_equal answer_name, @answer.member.name
  end

  test "should not appear as anonymous user when answer if the member is the room owner and the question owner" do
    answer_name = @answer.member.name

    if (@answer.anonymous && @room.owner.id != @member.id && @member.id != @answer.member.id)
      @answer.member.name = "Usuário anônimo"
    end

    assert_equal answer_name, @answer.member.name
  end

end
