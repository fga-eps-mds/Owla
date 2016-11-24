Given(/^I go to (.+)$/) do |path|
  visit path
end

Given(/^I visit "(.+)" room$/) do |object|
  room = Room.find_by(name: object)
  visit room_path(room)
end

Given(/^I visit "(.+)" edit room$/) do |object|
  room = Room.find_by(name: object)
  visit edit_room_path(room)
end

Given(/^I visit "(.+)" topic$/) do |object|
  topic = Topic.find_by(name: object)
  visit topic_path(topic)
end

Given(/^I visit "(.+)" edit topic$/) do |object|
  topic = Topic.find_by(name: object)
  visit edit_topic_path(topic)
end
When(/^I click "(.+)"$/) do |link|
  click_link(link)
end

When(/^I click button "(.+)"$/) do |link|
  click_button(link)
end

Then(/^I should be in "(.+)"$/) do |page|
  assert current_path == page
end

Then(/^I should be in "(.+)" homepage$/) do |object|
  member = Member.find_by(name: object)
  assert current_path == "/members/#{member.id}/home"
end

Then(/^I should be in "(.+)" edit$/) do |object|
  member = Member.find_by(name: object)
  assert current_path == "/members/#{member.id}/home"
end

Then(/^I should be in "(.+)"'s rooms$/) do |object|
  member = Member.find_by(name: object)
  assert current_path == "/members/#{member.id}/myrooms"
end

Then(/^I should be in "(.+)"'s joined rooms$/) do |object|
  member = Member.find_by(name: object)
  assert current_path == "/members/#{member.id}/joined"
end

Then(/^"(.+)" should be in all rooms page$/) do |object|
  member = Member.find_by(name: object)
  assert current_path == "/members/#{member.id}/rooms"
end

Then(/^I should be in "(.+)" room$/) do |object|
  room = Room.find_by(name: object)
  assert current_path == "/rooms/#{room.id}"
end

Then(/^I should be in "(.+)" topic$/) do |object|
  topic = Topic.find_by(name: object)
  assert current_path == "/topics/#{topic.id}"
end

When(/^I write "(.+)" on "(.+)"$/) do |value, field|
  fill_in field, :with => value
end


Given(/^I have created "(.+)"$/) do |value|
  member = Member.create(name: "Victor Navarro", email: value, alias: "vivi",
  password: 'testtest', password_confirmation: 'testtest')
end

Given(/^"(.+)" has created "(.+)" room$/) do |object, value|
  member = Member.find_by(name: object)
  room = Room.create(name: value, description: "2015/1", owner_id: member.id)
end

Given(/^"(.+)" room has "(.+)" topic$/) do |object, value|
  room = Room.find_by(name: object)
  topic = Topic.create(name: value, description: "Aula de 22/11", room_id: room.id)
end

And(/^the object with attribute "(.+)" and value "(.+)" of "(.+)" klass was created$/) do |attribute, value, klass|
  object = klass.capitalize.constantize.find_by("#{attribute}": value)
  assert klass.capitalize.constantize.last.id == object.id
end
