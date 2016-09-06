require 'test_helper'

class MemberTest < ActiveSupport::TestCase
	def setup 
		@member = Member.new(name: "Newest member",  alias: "nickname", email: "testing@email.com",
				password: "foobar", password_confirmation: "foobar")
	end

	test "tem que rodar" do 
		assert @member.valid?
	end

	test "deve conter o nome" do 
		@member.name = "	"
		assert_not @member.valid?
	end
	test "deve conter o alias" do 
		@member.alias = "	"
		assert_not @member.valid?
	end 
	test "deve conter o email" do
		@member.email = "	"
		assert_not @member.valid?
	end
	test "deve conter a senha" do
		@member.password = "	"
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
	test "tamanho do alias" do
		@member.alias = "a" * 41
		assert_not @member.valid?
	end
	test "tamanho da senha" do
		@member.password = "0" * 16
		assert_not @member.valid?
	end
	test "formato valido do email" do
		valid_addresses = %w[testing@example.com MEMBER@foo.COM A_MEM-BER@foo.bar.org
							first.last@foo.jp alice+bob@baz.cn]
		valid_addresses.each do |valid_address|
			@member.email = valid_address
			assert @member.valid?, "#{valid_address.inspect} should be valid"
		end
	end
	test "formato INvalido do email" do 
		invalid_addresses = %w[testing@example,com member_at_foo.org member.name@example.
							foo@bar_baz.com foo@bar+baz.com]
		invalid_addresses.each do |invalid_address|
			@member.email = invalid_address
			assert_not @member.valid?, "#{invalid_address.inspect} should be invalid"
		end
	end
	test "unicidade de email" do 
		duplicate_member = @member.dup
		duplicate_member.email = @member.email.upcase
		@member.save
		assert_not duplicate_member.valid?
	end
	test "email deve ser salvo em minusculo" do
		mixed_case_email = "FoO@ExAmPlE.CoM"
		@member.email = mixed_case_email
		@member.save
		assert_equal mixed_case_email.downcase, @member.reload.email
	end
end
