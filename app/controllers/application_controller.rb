class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  include SessionsHelper
  include RoomHelper
  include NotificationHelper

  rescue_from Exception, :with => :server_exception
  rescue_from ActiveRecord::RecordNotFound, :with => :server_exception

  def server_exception
    redirect_to server_error_path
  end

end
