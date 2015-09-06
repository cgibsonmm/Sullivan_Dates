require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new( name: "Example User", email: "user@example.com", zip_code: "12747")
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "user name should be presnent" do
    @user.name = "   "
    assert_not @user.valid?
  end

  test "user name should be at least 3 char" do
    @user.name = "aa"
    assert_not @user.valid?
  end

  test "user name should be less then 55 char" do
    @user.name = "a" * 56
    assert_not @user.valid?
  end
# Finish tests 
  test "email should be pressent" do
    @user.email = "   "
    assert_not @user.valid?
  end


end
