require 'test_helper'

class LikedRestaurantTest < ActiveSupport::TestCase
  test "should not save without the user_id" do
    likedrestaurant = LikedRestaurant.new
    likedrestaurant.restaurant_id = 1
    #member.password = "dghsdg"
    assert_equal(false,likedrestaurant.save)
  end
  test "should not save without the restaurant_id" do
    likedrestaurant = LikedRestaurant.new
    likedrestaurant.user_id = 1
    #member.password = "dghsdg"
    assert_equal(false,likedrestaurant.save)
  end
  test "should not save without boolean value in restaurant_id" do
    likedrestaurant = LikedRestaurant.new
    likedrestaurant.restaurant_id = 123
    #member.password = "dghsdg"
    assert_equal(false,likedrestaurant.save)
  end
  test "should not save non numerical value in user_id" do
    likedrestaurant = LikedRestaurant.new
    likedrestaurant.user_id = "test"
    #member.password = "dghsdg"
    assert_equal(false,likedrestaurant.save)
  end
  test "should not save empty value to liked restaurant" do
    likedrestaurant = LikedRestaurant.new
    assert_equal(false,likedrestaurant.save)
  end
  test "should not save non numerical value in user_id and restaurant_id" do
    likedrestaurant = LikedRestaurant.new
    likedrestaurant.user_id = "test"
    likedrestaurant.restaurant_id = "test"

    assert_equal(false,likedrestaurant.save)
  end
  test "should  not save with alphanumerical value in user_id and restaurant_id" do
    likedrestaurant = LikedRestaurant.new
    likedrestaurant.user_id = "1sdf"
    likedrestaurant.restaurant_id = "1sdf"

    assert_equal(false,likedrestaurant.save)
  end
  test "should report error" do
    # some_undefined_variable is not defined elsewhere in the test case
    assert_raises(NameError) do
      some_undefined_variable
    end
  end
end
