require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(first_name: "Example", last_name: "User", email:"User@example.com", zip_code: "12747")
  end

  test "@user should be valid" do
    assert @user.valid?
  end

  test "@user first name should not be blank" do
    @user.first_name = "  "
    assert_not @user.valid?
  end

  test "@user name should not be too short" do
    @user.first_name = "fo"
    assert_not @user.valid?
  end

  test "@user first name is not too long" do
    @user.first_name = "a" * 56
    assert_not @user.valid?
  end

  test "@user last name should be present" do
    @user.last_name = ' '
    assert_not @user.valid?
  end

  test "@user last name should not be too short" do
    @user.last_name = "aA"
    assert_not @user.valid?
  end

  test "@user last name should not be too long" do
    @user.last_name = "a" * 56
    assert_not @user.valid?
  end

  test "@user email should be present" do
    @user.email = "  "
    assert_not @user.valid?
  end

  test "@user email should not be too long" do
    @user.email = "a" *255
    assert_not @user.valid?
  end

  test "@user email should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid? "#{valid_address.inspect} should be valid"
    end
  end

  test "@user email validation should reject invalid adresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "@user email should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "@user email should be saved in lower case" do
    mixed_case_email = "UsER@ExaMplE.Com"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "@user email cant have too many .." do
    too_many_per = "user@example..com"
    @user.email = too_many_per
    @user.save
    assert_not @user.valid?
  end

  test "@user should have zip code" do
    @user.zip_code = "  "
    assert_not @user.valid?
  end

  test "@user zip code should be 5 char" do
    wrong_length_zip_codes = %w[1234 123456]
    wrong_length_zip_codes.each do |wrong_length_zip_code|
      @user.zip_code = wrong_length_zip_code
      assert_not @user.valid? "#{wrong_length_zip_code} should be invalid"
    end
  end

  test "@user zip code in sullivan should be valid" do
    zip_codes_in_sullivan = (12719..12792)
    zip_codes_in_sullivan.each do |zip|
      @user.zip_code = zip
      @user.save
      assert @user.valid?, "#{zip} should be valid"
    end
  end

  test "@user zip code not in sullivan should be invalid" do
    zip_not_in_sullivan = %w[11111 12796 12700 22222]
    zip_not_in_sullivan.each do |zip|
      @user.zip_code = zip
      @user.save
      assert_not @user.valid?, "#{zip} should not be valid"
    end
  end


end
