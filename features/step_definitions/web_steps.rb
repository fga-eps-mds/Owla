Given(/^I go to (.+)$/) do |path|
  visit path
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

When(/^I write "(.+)" on "(.+)"$/) do |value, field|
  fill_in field, :with => value
end

Given(/^I have created "(.+)"$/) do |value|
  member = Member.create(name: "Victor Navarro", email: value, alias: "vivi",
  password: 'testtest', password_confirmation: 'testtest')
end

And(/^the object with attribute "(.+)" and value "(.+)" of "(.+)" klass was created$/) do |attribute, value, klass|
  object = klass.capitalize.constantize.find_by("#{attribute}": value)
  assert klass.capitalize.constantize.last.id == object.id
end
