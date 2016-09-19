require 'test_helper'

class RoomTest < ActiveSupport::TestCase

  def setup
    @room = Room.create(name: "IAL")
  end

  test "should save a valid room" do
    assert @room.save
  end

  test "should save room with exactly 2 or 255 characters name" do
    @valid_1 = Room.create(name: "-"*2)
    assert @valid_1.save
    @valid_2 = Room.create(name: "-"*255)
    assert @valid_2.save
  end

  test "should not save an unamed room" do
    @invalid = Room.create(name: nil)
    assert_not @invalid.save
  end

  test "should not save a room with name smaller than 2 characters" do
    @invalid = Room.create(name: "C")
    assert_not @invalid.save
  end

  test "should not save a room with name bigger than 255 characters" do
    @invalid = Room.create(name: "-"*256)
    assert_not @invalid.save
  end

  test "should create not null room" do
    assert_not_nil @room
  end

  test "should change name when room is edited" do
    before = @room.name
    @room.update_attribute(:name,"Cálculo 1")
    after = @room.name
    assert_not_equal before,after
  end

  test "should delete room" do
      room_id = @room.id
      count_before = Room.all.count
      @room.destroy
      recovered_room = Room.where(:id => room_id)
      count_after = Room.all.count
      assert_equal recovered_room.count, 0
      assert_equal count_before,count_after+1
  end
end
