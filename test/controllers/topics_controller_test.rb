require 'test_helper'

class TopicsControllerTest < ActionDispatch::IntegrationTest

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

	test "should get new" do
  
    get new_room_topic_path(@room)
    assert_response :success
  end
  
  test "should show topic" do
    @topic = Topic.new(name: 'SomeTopic', description: 'somedescription')
    @topic.room = @room
    @topic.save
    get "/topics/#{@topic.id}"
    assert_response :success
  end

  test "should not show topic"  do
    
    get '/topics/show', params: {id: 12}
    assert_response :missing
  end

	test "should create topic" do
    
    post "/rooms/#{@room.id}/topics", params: {
       topic: {
         name: "SomeTopic",
         description: "somedescription"
        }
      }
    assert_redirected_to room_topics_path(@room)
  end
end
