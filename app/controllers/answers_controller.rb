class AnswersController < ApplicationController
  protect_from_forgery with: :exception
  before_action :authenticate_member

  def index
    @answer = Answer.all
  end

  def new
    @answer = Answer.new
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to answers_path
    else
      flash[:alert] = "Answer not created"
      render 'new'
    end
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
  end

  private
    def answer_params
    params.require(:answer).permit(:content)
  end
end
