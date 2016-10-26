require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
   def setup
    @profile = Profile.new(user_name: "Example User", email: "user@example.com",fname:"suresh",lname:"gaddam",password:"suresh",confirm_password:"suresh")
  end

  test "should be valid" do
    assert @profile.valid?
  end
  test "name should be present" do
    @profile.user_name = "     "
    assert_not @profile.valid?
  end
  test "email should be present" do
    @profile.email = "     "
    assert_not @profile.valid?
  end
  test "fname should be present" do
    @profile.fname = "     "
    assert_not @profile.valid?
  end
  test "lname should be present" do
    @profile.lname = "     "
    assert_not @profile.valid?
  end
  test "password should be present" do
    @profile.password = "     "
    assert_not @profile.valid?
  end
  test "confirm_password should be present" do
    @profile.confirm_password = "     "
    assert_not @profile.valid?
  end
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @profile.email = valid_address
      assert @profile.valid?, "#{valid_address.inspect} should be valid"
    end
  end
   test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @profile.email = invalid_address
      assert_not @profile.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  test "email addresses should be unique" do
    duplicate_user = @profile.dup
    duplicate_user.email = @profile.email.upcase
    @profile.save
    assert_not duplicate_user.valid?
  end
  test "user_name  should be unique" do
    duplicate_username = @profile.dup
    @profile.save
    assert_not duplicate_username.valid?
  end
  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @profile.email = mixed_case_email
    @profile.save
    assert_equal mixed_case_email.downcase, @profile.reload.email
  end
  test "password should be present (nonblank)" do
    @profile.password = @profile.confirm_password = " " * 6
    assert_not @profile.valid?
  end

  test "password should have a minimum length" do
    @profile.password = @profile.confirm_password = "a" * 5
    assert_not @profile.valid?
  end
end
