class SearchesController < ApplicationController
  skip_before_action :verify_authenticity_token if Rails.env.test?
  before_action :authenticate_member

  def search
    query = params[:query].downcase
    @rooms = []
    @topics = []

    Room.all.each do |room|
      @rooms << room if room.name.downcase.include?(query)
    end

    Topic.all.each do |topic|
      @topics << topic if topic.name.downcase.include?(query)
    end
  end

end
