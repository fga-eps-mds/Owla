require 'test_helper'

class MemberTest < ActiveSupport::TestCase
	def setup 
		@member = Member.new(name: "Newest member",  alias: "nickname", email: "testing@email.com",
				password: "foobar", password_confirmation: "foobar")
	end

	test "should validate member" do 
		assert @member.valid?
	end

	test "name should not be blank" do 
		@member.name = "	"
		assert_not @member.valid?
	end
	test "alias should not be blank" do 
		@member.alias = "	"
		assert_not @member.valid?
	end 
	test "email should not be blank" do
		@member.email = "	"
		assert_not @member.valid?
	end
	test "password should have 6 characters minimum" do
		@member.password = @member.password_confirmation = " " * 6
		assert_not @member.valid?
	end
	test "password should not be smaller than 5 characters" do 
		@member.password = @member.password_confirmation = "a" * 5
		assert_not @member.valid?
	end
	test "name should not be bigger than 60 characters" do
		@member.name = "a" * 61
		assert_not @member.valid?
	end
	test "email should not have more than 256 characters" do
		@member.email = "a" * 256 + "@email.com"
		assert_not @member.valid?
	end
	test "alias should not be bigger than 40 characters" do
		@member.alias = "a" * 41
		assert_not @member.valid?
	end
	test "password should not be bigger than 15 ch" do
		@member.password = "0" * 16
		assert_not @member.valid?
	end
	test "email should obey validation format" do
		valid_addresses = %w[testing@example.com MEMBER@foo.COM A_MEM-BER@foo.bar.org
							first.last@foo.jp alice+bob@baz.cn]
		valid_addresses.each do |valid_address|
			@member.email = valid_address
			assert @member.valid?, "#{valid_address.inspect} should be valid"
		end
	end
	test "email should not obey invalid format" do 
		invalid_addresses = %w[testing@example,com member_at_foo.org member.name@example.
							foo@bar_baz.com foo@bar+baz.com]
		invalid_addresses.each do |invalid_address|
			@member.email = invalid_address
			assert_not @member.valid?, "#{invalid_address.inspect} should be invalid"
		end
	end
	test "member should not have duplicate emails" do 
		duplicate_member = @member.dup
		duplicate_member.email = @member.email.upcase
		@member.save
		assert_not duplicate_member.valid?
	end
	test "every emails should be saved in downcase" do
		mixed_case_email = "FoO@ExAmPlE.CoM"
		@member.email = mixed_case_email
		@member.save
		assert_equal mixed_case_email.downcase, @member.reload.email
	end
end
