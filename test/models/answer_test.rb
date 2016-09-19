require 'test_helper'

class AnswerTest < ActiveSupport::TestCase

  def setup
    @room = Room.create(name: "c1")
    @topic = @room.topics.create(name: "limit")
    @question = @topic.questions.create(content: "Is there a limit?")
  end

  test "should not save empty answer" do
    @invalid = @question.answers.create(content: "")
    assert_not @invalid.save
  end

  test "should save a valid answer" do
    @valid = @question.answers.create(content: "This is valid.")
    assert @valid.save
  end

  test "should not save an answer without a question" do
    @answer = Answer.create(content: "Invalid Answer")
    assert_not @answer.save
  end

  test "should create not null answer" do
    @answer = @question.answers.create(content:"Yes")
    assert_not_nil @answer
  end

  test "edited atribute should be different" do
    @answer = @question.answers.create(content:"Yes")
    before = @answer.content
    assert before
    @answer.update_attribute :content, "No"
    after = @answer.content
    assert_not_equal before, after
  end

  test "answer should be deleted" do
    @answer = @question.answers.create(content:"Yes")
    before = @question.answers.count
    assert before
    @question.answers.first.destroy
    after = @question.answers.count
    assert_equal before,after+1
  end
end
