require 'test_helper'

class QuestionTest < ActiveSupport::TestCase

  def setup
    @member = Member.create(name: "Linus Torvalds", alias: "Lineu", email: "linuxFTW@linux.com", password: "i<3linux", password_confirmation: "i<3linux")
    @room = Room.create(name: "c1", description: "-"*2)
    @topic = @room.topics.create(name: "Limite", member: @member)
  end

  test "should not save a question with a null name" do
    @question = @topic.questions.new(content: nil, member: @member)
    assert_not @question.save
  end

  test "should not save a question with content smaller than 5 characters" do
    @question = @topic.questions.new(content: "1234", member: @member)
    assert_not @question.save
  end

  test "should save a question with exactly 5 characters" do
    @question = @topic.questions.new(content: "12345", member: @member)
    assert @question.save
  end

  test "should not save a question without a topic" do
    @invalid = Question.new(content: "1+1=3?", member: @member)
    assert_not @invalid.save
  end

  test "should create a not null question" do
    @question = @topic.questions.new(content: "What is love?", member: @member)
    assert_not_nil @question
  end

  test "should change content when question is edited" do
    @question = @topic.questions.new(content: "What is love?", member: @member)
    assert @question
    before_content = @question.content
    @question.update_attribute(:content,"Is this the real life?")
    after_content = @question.content
    assert_not_equal before_content,after_content
  end

  test "should delete question" do
    @question = @topic.questions.create(content: "What is love?", member: @member)
    question_id = @question.id
    count_before = Question.count
    @question.destroy
    recovered_question = Question.where(:id => question_id)
    count_after = Question.count
    assert_equal recovered_question.count, 0
    assert_equal count_before,count_after+1
  end
end
