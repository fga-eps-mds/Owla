require 'test_helper'

class AnswersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @member = Member.create(name: "Thalisson", alias: "thalisson", email: "thalisson@gmail.com", password: "12345678", password_confirmation: "12345678")
    @member_wrong = Member.create(name: "Thalisson2", alias: "thalisson2", email: "thalisson2@gmail.com", password: "12345678", password_confirmation: "12345678")

    @room = Room.new(name: "calculo 1", description: "teste1")
    @room.owner = @member
    @room.save

    @room_wrong = Room.new(name: 'calc2', description: 'teste2')
    @room_wrong.owner = @member_wrong
    @room_wrong.save

    @topic = @room.topics.new(name: "limites", description: "description1")
    @topic.save

    @topic_wrong = @room_wrong.topics.new(name: 'edo', description: 'teste2')
    @topic_wrong.save

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

  test 'only room owner should change moderated attribute of an answer' do
    @not_owner_member = Member.create(name: "Thalisson2", alias: "thalisson2", email: "thalisson2@gmail.com", password: "123456789", password_confirmation: "123456789")
    sign_out_as @member
    sign_in_as @not_owner_member
    post "/moderate_answer/#{@answer.id}"
    @answer.reload
    assert_not_equal true, @answer.moderated
  end

  test 'only room owner should change content of a moderated answer' do
    @not_owner_member = Member.create(name: "Thalisson2", alias: "thalisson2", email: "thalisson2@gmail.com", password: "123456789", password_confirmation: "123456789")
    sign_out_as @member
    sign_in_as @not_owner_member
    post "/moderate_answer/#{@answer.id}"
    @answer.reload
    assert_not_equal "This answer has been moderated because it's content was considered inappropriate", @answer.content
  end

  test 'should change the message after moderating' do
    post "/moderate_answer/#{@answer.id}"
    @answer.reload
    assert_equal "This answer has been moderated because it's content was considered inappropriate", @answer.content
  end

  test 'boolean attribute moderated should change after moderated' do
    post "/moderate_answer/#{@answer.id}"
    @answer.reload
    assert_equal true, @answer.moderated
  end

  test 'should answer be anonymous if the option is marked' do
    post "/questions/#{@question.id}/answers", params: {
      answer: {
        content: 'answer content',
        anonymous: true
      }
    }

      answer = Answer.last

      assert_equal answer.anonymous, true
  end

  test 'should answer not be anonymous if the option is not marked' do
      post "/questions/#{@question.id}/answers", params: {
        answer: {
          content: 'answer content'
        }
      }

      answer = Answer.last

      assert_not_equal answer.anonymous, true
  end

end
