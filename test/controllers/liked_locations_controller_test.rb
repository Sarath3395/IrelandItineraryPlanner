require 'test_helper'

class LikedLocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @liked_location = liked_locations(:one)
  end

  test "should get index" do
    get liked_locations_url
    assert_response :success
  end

  test "should get new" do
    get new_liked_location_url
    assert_response :success
  end

  test "should create liked_location" do
    assert_difference('LikedLocation.count') do
      post liked_locations_url, params: { liked_location: { location_id: @liked_location.location_id, user_id: @liked_location.user_id } }
    end

    assert_redirected_to liked_location_url(LikedLocation.last)
  end

  test "should show liked_location" do
    get liked_location_url(@liked_location)
    assert_response :success
  end

  test "should get edit" do
    get edit_liked_location_url(@liked_location)
    assert_response :success
  end

  test "should update liked_location" do
    patch liked_location_url(@liked_location), params: { liked_location: { location_id: @liked_location.location_id, user_id: @liked_location.user_id } }
    assert_redirected_to liked_location_url(@liked_location)
  end

  test "should destroy liked_location" do
    assert_difference('LikedLocation.count', -1) do
      delete liked_location_url(@liked_location)
    end

    assert_redirected_to liked_locations_url
  end
end
