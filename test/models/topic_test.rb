require 'test_helper'

class TopicTest < ActiveSupport::TestCase
 
def setup 
		@topic = Topic.new(name: "RUP")
	end

	test "name should not be blank" do 
		@topic.name = "	  "
		assert_not @topic.valid?
	end
	
	test "name should be smaller than 2 characters" do 
		@topic.name = "a"
		assert_not @topic.valid?
	end
	
	test "name should be bigger than 15 characters" do 
		@topic.name = "aaaaaaaaaaaaaaaa"
		assert_not @topic.valid?
	end
	
	test "topic should not have duplicate names" do 
		duplicate_topic = @topic.dup
		duplicate_topic.name = @topic.name.upcase
		@topic.save
		assert_not duplicate_topic.valid?
	end

end
