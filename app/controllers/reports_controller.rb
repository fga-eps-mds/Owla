class ReportsController < ApplicationController

  def index
    @reports = Report.all
  end

  def new
    @report = Report.new
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update_report_answer
    @report = Report.find(params[:id])

    if @report.update_attributes(:explanation)
      flash[:alert] = "Explanation updated"
      redirect_to topic_path(@report.answer.question.topic)
    else
      flash[:alert] = "Explanation could not be updated"
      render 'edit'
    end
  end

  def update_report_question
    @report = Report.find(params[:id])

    if @report.update_attributes(:explanation)
      flash[:alert] = "Explanation updated"
      redirect_to topic_path(@report.question.topic)
    else
      flash[:alert] = "Explanation could not be updated"
      render 'edit'
    end
  end

  def create_report_answer
    member = current_member
    @answer = Answer.find(params[:id])

    @topic = @answer.question.topic
    @room = @topic.room

    if @answer.report.blank? || !@answer.report.members.include?(member)
      @report = Report.new
      @report.moderator = @room.owner
      @report.reported = @answer.member
      @report.answer = @answer
      @report.members << current_member

      if @report.save
        flash[:alert] = "Your report was submitted"
        redirect_to topic_path(@topic)
      else
        flash[:alert] = "Report not created"
        redirect_to topic_path(@topic)
      end
    else
      flash[:alert] = "You have already reported this user"
      redirect_to topic_path(@topic.id)
    end
  end

  def show
    @report = Report.find(params[:id])
  end

  def create_report_question
    member = current_member
    @question = Question.find(params[:id])

    @topic = @question.topic
    @room = @topic.room

    if @question.report.blank? || !@question.report.members.include?(member)
      @report = Report.new
      @report.moderator = @room.owner
      @report.reported = @question.member
      @report.question = @question
      @report.members << current_member

      if @report.save
        flash[:alert] = "Your report was submitted"
        redirect_to topic_path(@topic)
      else
        flash[:alert] = "Report not created"
        redirect_to topic_path(@topic)
      end
    else
      flash[:alert] = "You have already reported this user"
      redirect_to topic_path(@topic.id)
    end
  end


end
