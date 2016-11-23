class StaticPagesController < ApplicationController
  before_action :authenticate_member, :only => [:help]
  def routing_error
  end

  def help
  end
end
