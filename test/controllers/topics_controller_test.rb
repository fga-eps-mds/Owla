require 'test_helper'

class TopicsControllerTest < ActionDispatch::IntegrationTest

	test "should get new" do
    get '/topics/new'
    assert_response :success
  end
  
  test "should show topic" do
    topic = Topic.create(name: 'SomeTopic')

    get '/topics/', params: {id: topic.id}
    assert_response :success
  end

  test "should not show topic"  do
    get '/topics/show', params: {id: 12}
    assert_response :missing
  end

# 	test "should create topic" do
#     post '/topics', params: {
#        topic: {
#          name: "SomeTopic",
#         }
#       }
#     assert_redirected_to '/topics'
#   end
end
