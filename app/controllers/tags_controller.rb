class TagsController < ApplicationController
  skip_before_action :verify_authenticity_token if Rails.env.test?
    before_action :authenticate_member

	def index
	  @tags = Tag.all
	end

	def new
      @question = Question.find(params[:question_id])
      @tag = Tag.new
	end

	def show
	  @tag = Tag.find(params[:id])
	end

	def create
      @question = Question.find(params[:question_id])
	  @tag = Tag.new(tag_params)
	  @tag.questions << @question

	  if @tag.save
	    redirect_to topic_path(@question.topic)
	  else
	    flash[:alert] = "Tag not created"
        render 'new'
	  end
	end

	def edit
	  @question = Question.find(params[:id])
      @question.tags
	end

	def update
	  @tag = Tag(params[:id])
	  @question = @tag.questions

	  if @tag.update_attributes(tag_params)
	    flash[:success] = "Tag atualizada com sucesso"
		redirect_to topic_path(@question.topic_id)
	  else
	    render 'edit'
	  end
	end

	def destroy
      @tag = Tag.find(params[:id])
      @tag.destroy
      @question = @tag.questions
      redirect_to question_tags_path(@question)
	end

private

	def tag_params
	  params.require(:tag).permit(:content, :question_id)
	end
end
