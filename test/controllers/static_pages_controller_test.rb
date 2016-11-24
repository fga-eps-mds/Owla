require 'test_helper'
include SessionsHelper

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @member = Member.create(name: "Thalisson", alias: "thalisson", email: "thalisson@gmail.com", password: "12345678", password_confirmation: "12345678")
  end

  test "should get routing_error page" do
    get "/routing_error"
    assert_response :success
  end

  test "should get help page if logged in" do
    sign_in_as @member
    get help_path
    assert_response :success
  end

  test "should not get help page if not logged in" do
    get "/help"
    assert_response :redirect
  end

end
