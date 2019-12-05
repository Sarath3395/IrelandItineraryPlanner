require 'test_helper'

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restaurant = restaurants(:one)
  end

  # called after every single test
  teardown do
    # when controller is using cache it may be a good idea to reset it afterwards
    Rails.cache.clear
  end

  test "should show hotel" do
    # Reuse the @article instance variable from setup
    get restaurant_url(@restaurant)
    assert_response :success
  end

  test "should destroy hotel" do
    assert_difference('Restaurant.count', -1) do
      delete restaurant_url(@restaurant)
    end

    assert_redirected_to restaurants_path
  end

  test "should update restaurant" do
    patch restaurant_url(@restaurant), params: { restaurant: { name: "updated" } }

    assert_redirected_to restaurant_path(@restaurant)
    # Reload association to fetch updated data and assert that title is updated.
    @restaurant.reload
    assert_equal "updated", @restaurant.name
  end
end
