require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  test "should get new" do
    get sessions_new_url
    assert_response :success
  end

  test "should create session" do
  	post login_path, params{session:{email:"member@member" , password:"password123"}}
  	assert_redirect_to member_path
  end

  test "should destroy session" do
  	delete login_path
  	assert_redirect_to root_url #ADICIONAR DEPOIS A HOMEPAGE
  end
end