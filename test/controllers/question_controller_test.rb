require 'test_helper'

class QuestionControllerTest < ActionDispatch::IntegrationTest

  def setup
    @member = Member.create(name: "Thalisson", alias: "thalisson", email: "thalisson@gmail.com", password: "12345678", password_confirmation: "12345678")
    @room = Room.create(name: "calculo 1")
    @topic = @room.topics.create(name: "limites")
    @question = @topic.questions.create(content: "How did I get Here?")
  end

   test "should create question" do
     log_in @member
     post '/questions', params: {
       question: {
         content: "How did I get here?"
       }
     }
   end

  test "should edit question" do
    log_in @member

    question_content = @question.content

    patch "/questions/#{@question.id}", params: {
      question: { content: "Derivadas?" }
    } 

    @question.reload

    assert_not_equal question_content, @question.content
  end

   test "should not edit question when member is not logged in" do
    question_id = @question.id
    question_content = @question.content
    patch "/questions/#{question_id}", params: {
      question: { content: "Derivadas?" }
    } 

    @question.reload

    assert_equal question_content, @question.content
  end

  test "should delete question" do
    log_in @member
    get '/questions'
 
    assert_difference('Question.count', -1) do
      delete "/questions/#{@question.id}"
    end

    assert_redirected_to '/questions'
  end

  test "should not delete the question if user is not logged in" do
    delete "/questions/#{@question.id}"
    assert_redirected_to login_path
  end

  
  private

    def log_in(member)
      post '/login/', params: { session: { email: member.email, password: member.password } }
    end

end
