class QuestionController < ApplicationController
	
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

	def destroy
		@question = Question.find(params[:id])
		@question.destroy
	end

	private

		def question_params
			params.require(:question).permit(:content)
		end
end
