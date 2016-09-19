require 'test_helper'

class QuestionTest < ActiveSupport::TestCase

  def setup
    @room = Room.create(name: "c1")
    @topic = @room.topics.create(name: "limite")
  end

  test "question should not be blank" do
    @question = @topic.questions.create(content: "")
    assert_not @question.save
  end

  test "name should be bigger than 4 characters" do
    @question = @topic.questions.create(content: "12345")
    assert @question.save
  end

  test "name should not be smaller than 5 characters" do
    @question = @topic.questions.create(content: "1234")
    assert_not @question.save
  end
end
