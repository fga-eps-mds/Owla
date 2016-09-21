require 'test_helper'

class RoomControllerTest < ActionDispatch::IntegrationTest

  def setup
    @member = Member.create(name: 'matheus', 
                          email: 'matheus@gmail.com', 
                          password: '123456', 
                          password_confirmation: '123456', 
                          alias: 'mateusin')
    @room = Room.new(name: 'teste', description: 'teste2')
    @room.owner = @member
    @room.save
    sign_in_as @member
  end

  test "should get index" do
    get member_rooms_path(@member)
    assert_response :success
  end

  test "should not get index if not logged in" do
    sign_out_as @member
    get member_rooms_path(@member)
    assert_redirected_to root_path
  end

  test "should get new" do
    get new_member_room_path(@member)
    assert_response :success
  end

  test "should not get new if not logged in" do
    sign_out_as @member
    get new_member_room_path(@member)
    assert_redirected_to root_path
  end

  test "should create room" do
    post  "/members/#{@member.id}/rooms/", params: { room: { name: "teste", description: "testedescription" } }
    assert_redirected_to room_path(@member.my_rooms.last)
  end

  test "should not create room when missing name" do
    post "/members/#{@member.id}/rooms/", params: { room: { name: '' } }
    assert_redirected_to new_member_room_path(@member)
  end

  test "should get edit room" do
    get edit_room_path(@room)
    assert_response :success
  end

  test "should update room" do
    name_old = @room.name
    patch "/rooms/#{@room.id}", params: {room: { name: "teste2" } }
    @room.reload

    assert_not_equal name_old, @room.name
    assert_redirected_to "/rooms/#{@room.id}"
  end

  test "should destroy room" do
    assert_difference('Room.count', -1) do
      delete "/rooms/#{@room.id}"
      assert_redirected_to  member_rooms_path(@member)
    end
  end

end
