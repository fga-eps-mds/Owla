require 'test_helper'

class RoomTest < ActiveSupport::TestCase

  test "should not save an unamed room" do
    @room = Room.create(name:"")
    assert_not @room.save
  end

  test "name should be smaller than 256 characters" do
    @room = Room.create(name:"asdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf")
    assert_not @room.save
  end

  test "should save a valid room" do
    @valid = Room.create(name: "Cálculo 1")
    assert @valid.save
  end
end
