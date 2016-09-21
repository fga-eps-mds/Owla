require 'test_helper'

class AnswerTest < ActiveSupport::TestCase

  def setup
    @member = Member.create(name: "Linus Torvalds", alias: "Lineu", email: "linuxFTW@linux.com", password: "i<3linux", password_confirmation: "i<3linux")
    @room = Room.create(name: "c1", description: "-"*2)
    @topic = @room.topics.create(name: "limit", member: @member)
    @question = @topic.questions.create(content: "Is there a limit?", member: @member)
  end

  test "should not save empty answer" do
    @invalid = @question.answers.new(content: "", member: @member)
    assert_not @invalid.save
  end

  test "should save a valid answer" do
    @valid = @question.answers.new(content: "This is valid.", member: @member)
    assert @valid.save
  end

  test "should not save an answer without a question" do
    @answer = Answer.new(content: "Invalid Answer", member: @member)
    assert_not @answer.save
  end

  test "should not save an answer without an author" do
    @answer = Answer.new(content: "Owla > *projects ?")
    assert_not @answer.save
  end

  test "should create not null answer" do
    @answer = @question.answers.create(content:"Yes", member: @member)
    assert_not_nil @answer
  end

  test "edited atribute should be different" do
    @answer = @question.answers.create(content:"Yes", member: @member)
    before = @answer.content
    assert before
    @answer.update_attribute :content, "No"
    after = @answer.content
    assert_not_equal before, after
  end

  test "answer should be deleted" do
    @answer = @question.answers.create(content:"Yes", member: @member)
    before = @question.answers.count
    assert before
    @question.answers.first.destroy
    after = @question.answers.count
    assert_equal before,after+1
  end
end
