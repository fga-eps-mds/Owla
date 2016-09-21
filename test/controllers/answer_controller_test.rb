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
end
