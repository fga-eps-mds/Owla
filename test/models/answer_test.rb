require 'test_helper'

class AnswerTest < ActiveSupport::TestCase

  def setup
    @room = Room.create(name: "c1")
    @topic = @room.topics.create(name: "limite")
    @question = @topic.questions.create(content: "quanto é o limite de x?")
  end

  test "should not save empty answer" do
    @invalid = @question.answers.create(content: "")
    assert_not @invalid.save
  end

  test "should save a valid answer" do
    @valid = @question.answers.create(content: "This is valid.")
    assert @valid.save
  end

end
