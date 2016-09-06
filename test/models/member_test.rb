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
	test "tamanho do nome" do
		@member.name = "a" * 61
		assert_not @member.valid?
	end
	test "tamanho do email" do
		@member.email = "a" * 256 + "@email.com"
		assert_not @member.valid?
	end
	test "tamanho da senha" do
		@member.password = "0" * 16
		assert_not @member.valid?
	end
  # test "the truth" do
  #   assert true
  # end
end
