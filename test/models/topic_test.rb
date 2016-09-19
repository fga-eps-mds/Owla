require 'test_helper'

class TopicTest < ActiveSupport::TestCase

def setup
		@topic = Topic.new(name: "RUP")
	end

	test "should not save a Topic with blank name" do
		@topic.name = "	  "
		assert_not @topic.save
	end

	test "should not save a room with name smaller than 2 characters" do
		@topic.name = "a"
		assert_not @topic.save
	end

	test "should not save a topic with name bigger than 255 characters" do
		@topic.name = "a"*256
		assert_not @topic.save
	end

	test "should not save a duplicated topic" do
		duplicate_topic = @topic.dup
		duplicate_topic.name = @topic.name.upcase
		@topic.save
		assert_not duplicate_topic.save
	end

end
