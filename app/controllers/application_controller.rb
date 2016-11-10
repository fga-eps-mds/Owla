class ApplicationController < ActionController::Base

  include SessionsHelper
  include RoomHelper
  include NotificationHelper

end
