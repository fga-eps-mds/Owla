class TopicsController < ApplicationController
    skip_before_action :verify_authenticity_token if Rails.env.test?
    before_action :authenticate_member

    def index
      @topics = Topic.all
    end

    def new
      @room = Room.find(params[:room_id])
      @topic = Topic.new
      @box_title = "Create a topic"
      @subtitle  = "Create"
      @placeholder_name = "Title"
      @placeholder_description = "Description"
      @url = room_topics_path(@room)
    end

    def show
      @topic = Topic.find(params[:id])
      @answer = Answer.new
    end

    def edit
      @topic = Topic.find(params[:id])
      @box_title = "Edit your topic"
      @subtitle  = "Settings"
      @placeholder_name = @topic.name
      @placeholder_description = @topic.description
      @url = topic_path(@topic)
    end

    def destroy
      @topic = Topic.find(params[:id])
      @room = @topic.room
      @topic.destroy

      redirect_to room_path @room
    end

  def update
    @topic = Topic.find(params[:id])

    if @topic.update_attributes(topic_params)
      redirect_to topic_path @topic
    else
      flash[:alert] = "O tópico não foi criado"
      render 'edit'
    end
  end

  def create
    @topic = Topic.new(topic_params)
    @room = Room.find(params[:room_id])
    @topic.room = @room
    if @topic.save
      redirect_to topic_path(@topic)
    else
      flash[:alert] = "Não foi possível criar o seu tópico"
      render 'new'
    end
  end

    private
      def topic_params
        params.require(:topic).permit(:name, :description, :room_id)
      end

end
