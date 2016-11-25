require 'test_helper'
include SessionsHelper

class NotificationHelperTest < ActionView::TestCase

  def setup
    @member = Member.create(name: "Thalisson", alias: "thalisson", email: "thalisson@gmail.com", password: "12345678", password_confirmation: "12345678")
    @another_member = Member.create(name: 'vitor', email: 'vitor@gmail.com', password: '123456', password_confirmation: '123456', alias: 'vitor')
    @room = Room.create(name: "calculo 1", description: "teste1", owner: @member)
    @topic = @room.topics.create(name: "limites", description: "description1")
    @question = @topic.questions.create(content: "How did I get here?", member: @member)
    @another_question = @topic.questions.create(content: "question?", member: @another_member)
    @answer = @question.answers.create(content: "answer", member: @member)
    @another_answer = @question.answers.create(content: "another answer", member: @another_member)
  end

  test "should send answered_question notification using answer" do
    log_in @another_member

    assert_difference('Notification.count', 1) do
      send_notification('answered_question', @answer)
    end
  end

  test "should send created_question notification" do
    log_in @another_member

    assert_difference('Notification.count', 1) do
      send_notification('created_question', @question)
    end
  end

  test "should send moderated_question notification" do
    log_in @member

    assert_difference('Notification.count', 1) do
      send_notification('moderated_question', @another_question)
    end
  end

  test "should send moderated_answer notification" do
    log_in @member

    assert_difference('Notification.count', 1) do
      send_notification('moderated_answer', @another_answer)
    end
  end

  test "should send reported_question notification" do
    log_in @another_member

    assert_difference('Notification.count', 1) do
      send_notification('reported_question', @question)
    end
  end

  test "should send reported_answer notification" do
    log_in @another_member

    assert_difference('Notification.count', 1) do
      send_notification('reported_answer', @answer)
    end
  end

  test "should send joined_room notification" do
    log_in @another_member

    assert_difference('Notification.count', 1) do
      send_notification('joined_room', @room)
    end
  end

  test "should send liked_question notification" do
    log_in @another_member

    assert_difference('Notification.count', 1) do
      send_notification('liked_question', @question)
    end
  end

  test "should send liked_answer notification" do
    log_in @another_member

    assert_difference('Notification.count', 1) do
      send_notification('liked_answer', @answer)
    end
  end

end
