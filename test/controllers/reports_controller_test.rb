require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @member = Member.create(name: "Thalisson", alias: "thalisson", email: "thalisson@gmail.com", password: "12345678", password_confirmation: "12345678")
    @member2 = Member.create(name: "thalisson2", alias: "thalisson2", email: "thalisson2@gmail.com", password: "12345678", password_confirmation: "12345678")
    @member3 = Member.create(name: "thalisson3", alias: "thalisson3", email: "thalisson3@gmail.com", password: "12345678", password_confirmation: "12345678")

    @room = Room.new(name: "calculo 1", description: "teste1")
    @room.owner = @member
    @room.save

    @topic = @room.topics.new(name: "limites", description: "description1")
    @topic.save

    @question = @topic.questions.new(content: "How did I get here?")
    @question.member = @member
    @question.save

    @answer = Answer.new(content: "CONTENT TEST")
    @answer.member = @member
    @answer.question = @question
    @answer.anonymous = false
    @answer.save

    @report = Report.create(explanation: "Inappropriate content")
    @report.moderator = @member
    @report.reported_id = @member2
    @report.reports << @member3

  end
  test 'should create report' do
    
  end
end
