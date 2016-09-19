require 'test_helper'

class MemberTest < ActiveSupport::TestCase

  def setup
    @member = Member.create(name: "Newest member",  alias: "nickname", email: "testing@email.com",
    password: "foobar", password_confirmation: "foobar")
  end

  test "should save valid member" do
    assert @member.save
  end

  test "should not save member with a blank name" do
    @member.name = ""
    assert_not @member.save
  end

  test "should not save a member with name smaller than 3 characters" do
    @member.name = "Ma"
    assert_not @member.save
  end

  test "should not save a member with name bigger than 255 characters" do
    @member.name = "a" * 256
    assert_not @member.save
  end

  test "should save a member with an exacty 3 or 255 characters name" do
    @member.name = "Ana"
    assert @member.save
    @member.name = "A"*255
    assert @member.save
  end

  test "should not save member with a blank alias" do
    @member.alias = ""
    assert_not @member.save
  end

  test "should not save member with alias bigger than 40 characters" do
    @member.alias = "a" * 41
    assert_not @member.save
  end

  test "should save a member with an exacty 1 or 40 characters alias" do
    @member.alias = "A"
    assert @member.save
    @member.alias = "A"*40
    assert @member.save
  end

  test "should not save member with a blank email" do
    @member.email = ""
    assert_not @member.save
  end

  test "should not save a member with email bigger than 255 characters" do
    @member.email = "a" * 256 + "@email.com"
    assert_not @member.save
  end

  test "should not save a member with a null password" do
    @member.password = password_confirmation = nil
    assert_not @member.save
  end

  test "should not save member with password smaller than 6 characters " do
    @member.password = @member.password_confirmation = "1" * 5
    assert_not @member.save
  end

  test "should not save member with password bigger than 15 characters" do
    @member.password = "0" * 16
    assert_not @member.save
  end

  test "should save member with an exactly 6 or 15 characters password" do
    @member.password = @member.password_confirmation = "1" * 6
    assert @member.save
    @member.password = @member.password_confirmation = "1" * 15
    assert @member.save
  end

  test "should save email with right validation format" do
    valid_addresses = %w[testing@example.com MEMBER@foo.COM A_MEM-BER@foo.bar.org
    first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @member.email = valid_address
      assert @member.save, "#{valid_address.inspect} should be valid"
    end
  end

  test "should not save member with email in an invalid format" do
    invalid_addresses = %w[testing@example,com member_at_foo.org member.name@example.
    foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @member.email = invalid_address
      assert_not @member.save, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "should note save member with duplicate emails" do
    duplicate_member = @member.dup
    duplicate_member.email = @member.email.upcase
    @member.save
    assert_not duplicate_member.save
  end

  test "should save emails in downcase" do
    mixed_case_email = "FoO@ExAmPlE.CoM"
    @member.email = mixed_case_email
    @member.save
    assert_equal mixed_case_email.downcase, @member.reload.email
  end
end
