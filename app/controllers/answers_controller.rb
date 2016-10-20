class AnswersController < ApplicationController
  include AnswerHelper
  skip_before_action :verify_authenticity_token if Rails.env.test?
  before_action :authenticate_member

  def index
    @answers = Answer.all
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question
    @answer.member = current_member

    if @answer.save
      send_cable @answer, 'create'
    end
  end

  def edit
    @answer = Answer.find(params[:id])

    respond_to do |format|
      format.js {}
    end
  end

  def update
    @answer = Answer.find(params[:id])

    if @answer.update_attributes(answer_params)
      send_cable @answer, 'update'
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @question = @answer.question

    if @answer.destroy
      send_cable @answer, 'delete'
    end
  end

  private
    def answer_params
      params.require(:answer).permit(:content, :question_id, :anonymous)
    end
end
