require 'test_helper'

class UserTest < ActiveSupport::TestCase
=begin
   test "the truth" do
     assert true
   end
=end
  test "Member should not save without validation" do
    user = User.new
    assert_equal(false,user.save)
  end
  test "should not save without the email" do
    user = User.new
    #member.email = "what@what.com"
    user.user_name = "dghsdg"
    assert_equal(false,user.save)
  end

  test "should not save when email is not unique" do
    user = User.new
    user.email = "what@what.com"
    user.password = "Qwerty@123"
    user1 = User.new
    user1.email = "what@what.com"
    user1.password = "Qwerty@123"
    assert_equal(true,user.save)
    assert_equal(false,user1.save)
  end


  test "should not save without the password" do
    user = User.new
    user.email = "what@what.com"
    #member.password = "dghsdg"
    assert_equal(false,user.save)
  end


  test "should not save the member when password is less than 9 characters" do
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
    user.password = "Qwertyuio"
    assert_equal(false,user.save)
  end
  test "should save the member when password have 1 uppercase, small case and a digit" do
    user = User.new
    user.email = "what@what.com"
    user.password = "Qwerty@123"
    assert_equal(true,user.save)
  end
end
