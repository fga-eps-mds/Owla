require 'test_helper'
include SessionsHelper

class SessionsControllerTest < ActionDispatch::IntegrationTest
  def setup
  	@member = Member.create(name: 'matheus', 
                          email: 'matheus@gmail.com', 
                          password: '123456', 
                          password_confirmation: '123456', 
                          alias: 'mateusin')
  end
  test "should get new" do
    get sessions_new_url
    assert_response :success
  end

  test "should create session" do
  	sign_in_as @member
  	assert_redirected_to "/members/#{@member.id}"
  end

  test "should logout" do
  	sign_in_as @member
  	assert_redirected_to "/members/#{@member.id}"

  	sign_out_as @member
  	follow_redirect!
  	assert_redirected_to login_url
  end
end
