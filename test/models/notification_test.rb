require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@member = Member.new(name: "Linus Torvalds", alias: "Lineu", email: "linuxFTW@linux.com", password: "i<3linux", password_confirmation: "i<3linux")
    @notification = Notification.new(message: "New Notification", member: @member) 
  end

  test "should save valid notification" do
  	assert @notification.save
  end

  test "should not save empty notification" do
  	@invalid = Notification.new(message:"", member: @member)
  	assert_not @invalid.save
  end

  test "should not save notification with message smaller than 5 characters" do
  	@invalid = Notification.new(message:"-"*4, member: @member)
    assert_not @invalid.save
  end

  test "should not save notification with message bigger than 50 characters" do
  	@invalid = Notification.new(message:"-"*51, member: @member)
    assert_not @invalid.save
  end

  test "should save notification when the message has exactly 5 or 50 characters" do
  	@valid1 = Notification.new(message:"-"*5, member: @member)
  	assert @valid1.save
  	@valid2 = Notification.new(message:"-"*50, member: @member)
    assert @valid2.save
  end

  test "atribute 'read' should be false by setting" do
  	assert_equals @notification.read, false
  end
end
