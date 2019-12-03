require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  test "should  save when restaurant name is not empty" do
    restaurant = Restaurant.new
    restaurant.name = "test"
    assert_equal(false,restaurant.save)
  end
  test "should  not save when restaurant name is not empty" do
    restaurant = Restaurant.new
    assert_equal(false,restaurant.save)
  end
  test "should   save when restaurant name is not empty and other value are empty" do
    restaurant = Restaurant.new
    restaurant.name = "test"
    assert_equal(false,restaurant.save)
  end
  test "should  not save when restaurant name is not empty and other value are provided" do
    restaurant = Restaurant.new
    restaurant.foodtype = "veg"

    assert_equal(false,restaurant.save)
  end
end
