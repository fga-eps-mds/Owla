class TagsController < ApplicationController
  skip_before_action :verify_authenticity_token if Rails.env.test?
    before_action :authenticate_member

	def index
    @tags = Tag.all
    @question = Question.find(params[:question_id])
	end

	def new
    @question = Question.find(params[:question_id])
    @tag = Tag.new
	end

	def create
    @question = Question.find(params[:question_id])
	  @tag = Tag.new(tag_params)
	  @tag.member = current_member
	  @question.tags << @tag

	  if @tag.save
	    redirect_to topic_path(@question.topic)
	  else
	    flash[:notice] = "Tag not created"
      render 'new'
    end
	end

	def edit
	  @tag = Tag.find(params[:id])
	end

	def update
	  @tag = Tag.find(params[:id])

	  if @tag.update_attributes(tag_params)
	    flash[:success] = "Tag updated successfully"
		  redirect_to question_tags_path(Question.find(params[:question].to_i))
	  else
      flash[:notice] = "Tag not updated"
	    render 'edit'
	  end
	end

	def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to question_tags_path(params[:question])
	end

  def add_tag_to_question
    @tag = Tag.find(params[:id])
    @question = Question.find(params[:question_id])
    @question.tags << @tag
    redirect_to topic_path(@question.topic)
  end

  def remove_tag_from_question
    @tag = Tag.find(params[:id])
    @question = Question.find(params[:question_id])
    @question.tags.delete(@tag)
    redirect_to topic_path(@question.topic)
  end

private
  def tag_params
	  params.require(:tag).permit(:content, :question_id, :color)
  end
end
