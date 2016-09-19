require 'test_helper'

class TopicsControllerTest < ActionDispatch::IntegrationTest

	test "should get new" do
    member = Member.create(name: 'matheus', 
                          email: 'matheus@gmail.com', 
                          password: '123456', 
                          password_confirmation: '123456', 
                          alias: 'mateusin')
    post '/login/', params: {session: { email: member.email, password: member.password } }
    get '/topics/new'
    assert_response :success
  end
  
  test "should show topic" do
    topic = Topic.create(name: 'SomeTopic')
    member = Member.create(name: 'matheus', 
                          email: 'matheus@gmail.com', 
                          password: '123456', 
                          password_confirmation: '123456', 
                          alias: 'mateusin')
    post '/login/', params: {session: { email: member.email, password: member.password } }
    get '/topics/', params: {id: topic.id}
    assert_response :success
  end

  test "should not show topic"  do
    member = Member.create(name: 'matheus', 
                          email: 'matheus@gmail.com', 
                          password: '123456', 
                          password_confirmation: '123456', 
                          alias: 'mateusin')
    post '/login/', params: {session: { email: member.email, password: member.password } }
    get '/topics/show', params: {id: 12}
    assert_response :missing
  end

	test "should create topic" do
    member = Member.create(name: 'matheus', 
                          email: 'matheus@gmail.com', 
                          password: '123456', 
                          password_confirmation: '123456', 
                          alias: 'mateusin')
    post '/login/', params: {session: { email: member.email, password: member.password } }
    post '/topics/', params: {
       topic: {
         name: "SomeTopic",
        }
      }
    assert_response :success
  end
end
