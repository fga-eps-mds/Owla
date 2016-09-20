class AnswersController < ApplicationController
  skip_before_action :verify_authenticity_token if Rails.env.test?
  before_action :authenticate_member

  def index
    @answers = Answer.all
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
    @answer.destroy
    redirect_to answers_path
  end

  private
    def answer_params
    params.require(:answer).permit(:content)
  end
end
