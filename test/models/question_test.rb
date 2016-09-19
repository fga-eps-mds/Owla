require 'test_helper'

class QuestionTest < ActiveSupport::TestCase

  def setup
    @room = Room.create(name: "c1")
    @topic = @room.topics.create(name: "Limite")
  end

  test "should not save a question with a null name" do
    @question = @topic.questions.create(content: nil)
    assert_not @question.save
  end

  test "should not save a question with content smaller than 5 characters" do
    @question = @topic.questions.create(content: "1234")
    assert_not @question.save
  end

  test "should save a question with exactly 5 characters" do
    @question = @topic.questions.create(content: "12345")
    assert @question.save
  end

  test "should not save a question without a topic" do
    @invalid = Question.create(content: "1+1=3?")
    assert_not @invalid.save
  end

  test "should create a not null question" do
    @question = @topic.questions.create(content: "What is love?")
    assert_not_nil @question
  end

  test "should change content when question is edited" do
    @question = @topic.questions.create(content: "What is love?")
    assert @question
    before_content = @question.content
    @question.update_attribute(:content,"Is this the real life?")
    after_content = @question.content
    assert_not_equal before_content,after_content
  end

  test "should delete question" do
    @question = @topic.questions.create(content: "What is love?")
    question_id = @question.id
    count_before = Question.all.count
    @question.destroy
    recovered_question = Question.where(:id => question_id)
    count_after = Question.all.count
    assert_equal recovered_question.count, 0
    assert_equal count_before,count_after+1
  end

end
