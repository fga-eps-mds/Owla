require 'test_helper'

class RoomControllerTest < ActionDispatch::IntegrationTest

  def setup
    @member = Member.create(name: 'matheus', 
                          email: 'matheus@gmail.com', 
                          password: '123456', 
                          password_confirmation: '123456', 
                          alias: 'mateusin')
    @room = Room.create(name: 'teste')
    sign_in_as @member
  end

  test "should get index" do
    get rooms_path

    assert_response :success
  end

  test "should not get index if not logged in" do
    sign_out_as @member

    get rooms_path
    assert_redirected_to login_url
  end

  test "should get new" do
    get '/rooms/new'
    assert_response :success
  end

  test "should not get new if not logged in" do
    sign_out_as @member

    get '/rooms/new'
    assert_redirected_to login_url
  end

  test "should create rooms" do
    post '/rooms', params: { room: { name: "teste" } }
    assert_redirected_to rooms_path
  end

  test "should not create rooms when missing name" do
    post '/rooms', params: { room: { name: '' } }
    assert_select '.alert'
  end

  test "should get edit room" do
    get "/rooms/#{@room.id}/edit"
    assert_response :success
  end

  test "should update room" do
    name_old = @room.name
    patch "/rooms/#{@room.id}", params: {room: {name: "teste2"} }
    @room.reload

    assert_not_equal name_old, @room.name
    assert_redirected_to "/rooms/#{@room.id}"
  end
end
