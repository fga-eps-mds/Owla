class QuestionsController < ApplicationController
  skip_before_action :verify_authenticity_token if Rails.env.test?
	before_action :authenticate_member
	
	def index
		@questions = Question.all
	end

	def new
        @topic = Topic.find(params[:topic_id])
		@question = Question.new
	end

	def show
		@question = Question.find(params[:id])
	end

	def create
        @topic = Topic.find(params[:topic_id])

		@question = Question.new(question_params)
        @question.topic = @topic
        @question.member = current_member

		if @question.save
            redirect_to topic_questions_path(@topic)
		else
			flash[:alert] = "Question not created"
            redirect_to new_topic_questions_path(@topic)
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
      @topic = @question.topic
      @question.destroy
      redirect_to topic_questions_path(@topic)
	end

	private

		def question_params
			params.require(:question).permit(:content, :topic_id)
		end
end
