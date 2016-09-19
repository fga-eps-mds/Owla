class TopicsController < ApplicationController
	skip_before_action :verify_authenticity_token if Rails.env.test?
    before_action :authenticate_member

	def index
		@topics = Topic.all
	end

	def new
		@topic = Topic.new
	end

	def show
		@topic = Topic.find(params[:id])
	end

	def edit
		@topic = Topic.find(params[:id])
	end

	def destroy
		@topic = Topic.find(params[:id])
		@topic.destroy

		redirect_to topics_path
	end

  def update
    @topic = Topic.find(params[:id])

    if @topic.update_attributes(topic_params)
      redirect_to topics_path
    else
      flash[:alert] = "O tópico não foi criado"
      render 'edit'
    end
  end

  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      redirect_to topics_path
    else
      flash[:alert] = "Não foi possível criar o seu tópico"
      render 'new'
    end
  end

	private
		def topic_params
			params.require(:topic).permit(:name)
		end

end