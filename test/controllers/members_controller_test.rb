require 'test_helper'
include SessionsHelper

class MembersControllerTest < ActionDispatch::IntegrationTest 
  test "should get new" do
    get '/members/new'
    assert_response :success
  end

  test "should create user" do
    post '/members', params: {
        member: {
          name: "matheus",
          email: "matheuss@gmail.com",
          password: "123456",
          password_confirmation: "123456",
          alias: "usertest8"
        }
      }
    assert_redirected_to '/members'
  end
  test "should not create user" do
    post '/members', params: {
        member: {
          name: "matheus",
          email: "matheuss@gmail.com",
          password: "123",
          alias: "usertest8"
        }
      }
    assert_select '.notice'
  end
  test "should show user" do
    member = Member.create(name: 'matheus', 
                          email: 'matheus@gmail.com', 
                          password: '123456', 
                          password_confirmation: '123456', 
                          alias: 'mateusin')
    post '/login/', params: {session: { email: member.email, password: member.password } }
    
    get '/members/', params: {id: member.id}
    assert_response :success
  end

  test "should not show user"  do
    member = Member.create(name: 'matheus', 
                          email: 'matheus@gmail.com', 
                          password: '123456', 
                          password_confirmation: '123456', 
                          alias: 'mateusin')
    post '/login/', params: {session: { email: member.email, password: member.password } }
    get '/members/show', params: {id: 12}
    assert_response :missing
  end
end
