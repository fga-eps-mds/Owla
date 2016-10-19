require 'test_helper'

class QuestionControllerTest < ActionDispatch::IntegrationTest

  def setup
    @false_option_anonymous = 0
    @true_option_anonymous = 1
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

  test "should question be anonymous if member marks option" do
    post "/topics/#{@topic.id}/questions", params: {
      question: {
        content: "question content",
        anonymous: @true_option_anonymous
      }
    }

    question = Question.last

    assert_equal question.anonymous, true
  end

  test "should question not be anonymous if member does not mark option" do
    post "/topics/#{@topic.id}/questions", params: {
      question: {
        content: "question content"
      }
    }

    question = Question.last

    assert_equal question.anonymous, false
  end

  # ACCEPTANCE TEST
  test "should not show member name and avatar to other users if question is anonymous" do

  end

  # ACCEPTANCE TEST
  test "should show member name and avatar if the question is anonymous and current member is the author of the question" do

  end

  # ACCEPTANCE TEST
  test "should show member name and avatar if the question is anonymous and current member is the owner of the room" do

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
