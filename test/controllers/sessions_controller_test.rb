require 'test_helper'
include SessionsHelper

class SessionsControllerTest < ActionDispatch::IntegrationTest
  
  test "should get new" do
    get sessions_new_url
    assert_response :success
  end
end
