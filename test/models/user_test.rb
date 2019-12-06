require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "User should not save without validation" do
    user = User.new
    assert_equal(false,user.save)
  end
  test "user should not save without the email" do
    user = User.new
    #member.email = "what@what.com"
    #user.email = "dghsdg"
    user.password = "Qwerty@123"
    assert_equal(false,user.save)
  end

  test "user should not save when email is not unique" do
    user = User.new
    user.email = "what@what.com"
    user.password = "Qwerty@123"
    user1 = User.new
    user1.email = "what@what.com"
    user1.password = "Qwerty@123"
    assert_equal(true,user.save)
    assert_equal(false,user1.save)
  end


  test "user should not save without the password" do
    user = User.new
    user.email = "what@what.com"
    #member.password = "dghsdg"
    assert_equal(false,user.save)
  end


  test "user should not save the member when password is less than 9 characters" do
    user = User.new
    user.email = "what@what.com"
    user.password = "Qwer!23"
    assert_equal(false,user.save)
  end

  test "should not save the member when password doesnt have 1 uppercase " do
    user = User.new
    user.email = "what@what.com"
    user.password = "qwerty@123"
    assert_equal(false,user.save)
  end

  test "should not save the member when password doesnt have 1 small case " do
    user = User.new
    user.email = "what@what.com"
    user.password = "QWERTY@123"
    assert_equal(false,user.save)
  end
  test "should not save the member when password doesnt have 1 digit" do
    user = User.new
    user.email = "what@what.com"
    user.password = "Qwertyuio!"
    assert_equal(false,user.save)
  end
  test "should not save the member when password doesnt have 1 special character" do
    user = User.new
    user.email = "what@what.com"
    user.password = "Qwertyuio1"
    assert_equal(false,user.save)
  end
  test "should save the member when password have 1 uppercase small case special character and a digit" do
    user = User.new
    user.email = "what@what.com"
    user.password = "Qwerty@123"
    assert_equal(true,user.save)
  end
  test "should report error" do
    # some_undefined_variable is not defined elsewhere in the test case
    assert_raises(NameError) do
      some_undefined_variable
    end
  end
end
