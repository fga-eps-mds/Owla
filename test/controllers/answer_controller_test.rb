require 'test_helper'

class AnswersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @member = Member.create(name: "Thalisson", alias: "thalisson", email: "thalisson@gmail.com", password: "12345678", password_confirmation: "12345678")
    @room = Room.create(name: "calculo 1")
    @topic = @room.topics.create(name: "limites")
    @question = @topic.questions.create(content: "How did I get here?")
    @answer = @question.answers.create(content: "Resposta da pergunta")
  end

   test "should create answer" do
     log_in @member
     @question
     post "/answers/new", params: {
       answer: {
         content: "Resposta da pergunta"
       }
     }
   end

   test "should edit anwer" do
     log_in @member
     @question
     answer_id = @answer.id
     answer_content = @answer.content
     patch "/answers/#{answer_id}", params: {
       answer: { content: "verdadeira resposta da pergunta" }
     } 

     @answer.reload

     assert_not_equal answer_content, @answer.content
   end

   test "should not edit answer when member is not logged in" do
    answer_id = @answer.id
    answer_content = @answer.content
    patch "/answers/#{answer_id}", params: {
      answer: { content: "verdadeira resposta da pergunta?" }
    } 

    @answer.reload

    assert_equal answer_content, @answer.content
  end

  test "should delete answer" do
    log_in @member
    get '/answers'
 
    assert_difference('Answer.count', -1) do
      delete "/answers/#{@answer.id}"
    end

    assert_redirected_to '/answers'
  end

  test "should not delete the answer if user is not logged in" do
    get '/answers'
    assert_redirected_to login_path
  end

  
  private

    def log_in(member)
      post '/login/', params: { session: { email: member.email, password: member.password } }
    end

end
