class AnswersController < ApplicationController
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
      redirect_to question_answers_path(@question)
    else
      flash[:alert] = "Answer not created"
      render 'new'
    end
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])

    if @answer.update_attributes(answer_params)
      flash[:success] = "Resposta atualizada com sucesso"
      redirect_to answers_path
    else
      render 'edit'
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @question = @answer.question
    @answer.destroy
    redirect_to question_answers_path(@question)
  end

  private
    def answer_params
      params.require(:answer).permit(:content, :question_id)
    end
end
