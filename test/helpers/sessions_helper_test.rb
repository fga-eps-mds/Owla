require 'test_helper'

class SessionsHelperTest < ActionView::TestCase

  def setup
    @member = Member.create(name: "rgtt", alias: "right", password: "12345678", password_confirmation: "12345678", email: "right@gmail.com")
    @wrong_member = Member.create(name: "wrgt", alias: "wrong", password: "", password_confirmation: "", email: "")
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
    assert_equal @member.id, current_member.id
  end

  test "member not logged in should not be current member" do
  	log_in @wrong_member
  	assert_not logged_in?
  	assert_not current_member
  end

  test "valid member should log out" do
    log_in @member
    assert logged_in?
    log_out
    assert_not logged_in?
  end
end
