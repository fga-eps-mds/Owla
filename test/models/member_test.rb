require 'test_helper'

class MemberTest < ActiveSupport::TestCase
	def setup 
		@member = Member.new(name: "Newest member", email: "testing@email.com", password: "0123456", alias: "nickname")
	end

	test "tem que rodar" do 
		assert @member.valid?
	end

	test "deve conter o nome" do 
		@member.name = ""
		assert_not @member.valid?
	end 
	test "deve conter o email" do
		@member.email = ""
		assert_not @member.valid?
	end
	test "deve conter a senha" do
		@member.password = ""
		assert_not @member.valid?
	end
  # test "the truth" do
  #   assert true
  # end
end
