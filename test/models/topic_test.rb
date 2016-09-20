require 'test_helper'

class TopicTest < ActiveSupport::TestCase

	def setup
		@member = Member.create(name: "Linus Torvalds", alias: "Lineu", email: "linuxFTW@linux.com", password: "i<3linux", password_confirmation: "i<3linux")
		@room = Room.create(name: "MDS", description: "-"*2)
		@topic = @room.topics.create(name: "RUP", member: @member)
	end

	test "should not save a Topic with blank name" do
		@topic.name = ""
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

	test "should save topic with exactly 2 or 255 characters name" do
		@valid_1 = @room.topics.create(name: "-"*2, member: @member)
		assert @valid_1.save
		@valid_2 = @room.topics.create(name: "-"*255, member: @member)
		assert @valid_2.save
	end

	test "should not save a duplicated topic" do
		duplicate_topic = @topic.dup
		duplicate_topic.name = @topic.name.upcase
		@topic.save
		assert_not duplicate_topic.save
	end

	test "should not save two topics with same downcase name" do
		assert @topic.save
		@topic2 = @room.topics.create(name: "rup", member: @member)
		assert_not @topic2.save
	end

	test "should not save a topic without a room" do
		@invalid = Topic.create(name: "Invalid", member: @member)
		assert_not @invalid.save
	end

	test "should create a not null topic" do
		assert_not_nil @topic
	end

	test "should change name when topic is edited" do
		before = @topic.name
		@topic.update_attribute(:name,"Cálculo 1")
		after = @room.name
		assert_not_equal before,after
	end

	test "should delete topic" do
			topic_id = @topic.id
			count_before = Topic.all.count
			@topic.destroy
			recovered_topic = Topic.where(:id => topic_id)
			count_after = Topic.all.count
			assert_equal recovered_topic.count, 0
			assert_equal count_before,count_after+1
	end
end
