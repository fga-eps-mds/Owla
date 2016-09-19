class QuestionsController < ApplicationController
  	skip_before_action :verify_authenticity_token if Rails.env.test?
	before_action :authenticate_member
	
	def index
		@questions = Question.all
	end

	def new
		@question = Question.new
	end

	def show
		@question = Question.find(params[:id])
	end

	def create
		@question = Question.new(question_params)

		if @question.save
			redirect_to questions_path
		else 
			flash[:alert] = "Question not created"
			render 'new'
		end
	end

	def edit
		@question = Question.find(params[:id])
	end

	def update
		@question = Question.find(params[:id])

		if @question.update_attributes(question_params)
			flash[:success] = "Questão atualizada com sucesso"
			redirect_to @question
		else
			render 'edit'
		end
	end

	def destroy
		@question = Question.find(params[:id])
		@question.destroy
		redirect_to questions_path
	end

	private

		def question_params
			params.require(:question).permit(:content)
		end
end
