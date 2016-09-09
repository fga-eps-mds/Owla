require 'test_helper'

class SessionsHelperTest < ActionView::TestCase

  def setup
    @member = member(:member)
    @wrong_member = member(name:"wrg" , alias:"" , password:"123" , email: "")
  end

  test "valid member should log in" do
    log_in @member
    assert logged_in?
  end

  test "invalid member should not log in" do
    log_in @wrong_member
    assert_not logged_in?
  end

  test "member logged in should be current member" do
    log_in @member
    assert logged_in?
    assert_not_nil current_member
  end

  test "member not logged in should not be current member" do
  	log_in @wrong_member
  	assert_not logged_in?
  	assert_not current_member
  end

  test "valid member should log out" do
    log_in @member
    assert logged_in?
    log_out @member
    assert_not logged_in?
  end
end