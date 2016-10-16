require 'test_helper'

class QuestionControllerTest < ActionDispatch::IntegrationTest

  def setup
    @member = Member.create(name: "Thalisson", alias: "thalisson", email: "thalisson@gmail.com", password: "12345678", password_confirmation: "12345678")

    @room = Room.new(name: "calculo 1", description: "teste1")
    @room.owner = @member
    @room.save

    @topic = @room.topics.new(name: "limites", description: "description1")
    @topic.save

    @question = @topic.questions.new(content: "How did I get here?")
    @question.member = @member
    @question.save

    sign_in_as @member
  end

  test "should get new" do
    get new_topic_question_path(@topic)
    assert_response :success
  end

  test "should get show" do

    get question_path(@question)
    assert_response :success
  end

  test "should create question" do
    post "/topics/#{@topic.id}/questions", params: {
      question: {
        content: "How did I get here?",
      }
    }
    assert_redirected_to topic_path(@topic)
  end

  test "should edit question" do
    question_content = @question.content

    patch "/questions/#{@question.id}", params: {
      question: { content: "Derivadas?" }
    }

    @question.reload

    assert_not_equal question_content, @question.content
  end

   test "should not edit question when member is not logged in" do
    sign_out_as @member
    question_id = @question.id
    question_content = @question.content
    patch "/questions/#{question_id}", params: {
      question: { content: "Derivadas?" }
    }

    @question.reload

    assert_equal question_content, @question.content
  end

  test "should delete question" do
    assert_difference('Question.count', -1) do
      delete "/questions/#{@question.id}"
      assert_redirected_to topic_path(@topic)
    end
  end

  test "should not delete the question if user is not logged in" do
    sign_out_as @member
    delete "/questions/#{@question.id}"
    assert_redirected_to root_path
  end

  test "only room owner should moderate question" do
    @member2 = Member.create(name: "Thalissonn", alias: "thalissonn", email: "thalissnon@gmail.com", password: "12345678", password_confirmation: "12345678")
    sign_out_as @member
    sign_in_as @member2
    post "/moderate_question/#{@question.id}"
    @question.reload
    assert_not_equal "This question has been moderated because it's content was considered inappropriate", @question.content
    assert_equal false, @question.moderated?
  end

  test "should message content and moderated attribute change if moderated" do
    post "/moderate_question/#{@question.id}"
    @question.reload
    assert_equal true, @question.moderated?
    assert_equal "This question has been moderated because it's content was considered inappropriate", @question.content
  end

end
