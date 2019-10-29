require 'test_helper'

class LikedRestaurantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @liked_restaurant = liked_restaurants(:one)
  end

  test "should get index" do
    get liked_restaurants_url
    assert_response :success
  end

  test "should get new" do
    get new_liked_restaurant_url
    assert_response :success
  end

  test "should create liked_restaurant" do
    assert_difference('LikedRestaurant.count') do
      post liked_restaurants_url, params: { liked_restaurant: { restaurant_id: @liked_restaurant.restaurant_id, user_id: @liked_restaurant.user_id } }
    end

    assert_redirected_to liked_restaurant_url(LikedRestaurant.last)
  end

  test "should show liked_restaurant" do
    get liked_restaurant_url(@liked_restaurant)
    assert_response :success
  end

  test "should get edit" do
    get edit_liked_restaurant_url(@liked_restaurant)
    assert_response :success
  end

  test "should update liked_restaurant" do
    patch liked_restaurant_url(@liked_restaurant), params: { liked_restaurant: { restaurant_id: @liked_restaurant.restaurant_id, user_id: @liked_restaurant.user_id } }
    assert_redirected_to liked_restaurant_url(@liked_restaurant)
  end

  test "should destroy liked_restaurant" do
    assert_difference('LikedRestaurant.count', -1) do
      delete liked_restaurant_url(@liked_restaurant)
    end

    assert_redirected_to liked_restaurants_url
  end
end
