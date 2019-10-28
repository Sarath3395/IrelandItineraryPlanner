require 'test_helper'

class LikedHotelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @liked_hotel = liked_hotels(:one)
  end

  test "should get index" do
    get liked_hotels_url
    assert_response :success
  end

  test "should get new" do
    get new_liked_hotel_url
    assert_response :success
  end

  test "should create liked_hotel" do
    assert_difference('LikedHotel.count') do
      post liked_hotels_url, params: { liked_hotel: { hotel_id: @liked_hotel.hotel_id, user_id: @liked_hotel.user_id } }
    end

    assert_redirected_to liked_hotel_url(LikedHotel.last)
  end

  test "should show liked_hotel" do
    get liked_hotel_url(@liked_hotel)
    assert_response :success
  end

  test "should get edit" do
    get edit_liked_hotel_url(@liked_hotel)
    assert_response :success
  end

  test "should update liked_hotel" do
    patch liked_hotel_url(@liked_hotel), params: { liked_hotel: { hotel_id: @liked_hotel.hotel_id, user_id: @liked_hotel.user_id } }
    assert_redirected_to liked_hotel_url(@liked_hotel)
  end

  test "should destroy liked_hotel" do
    assert_difference('LikedHotel.count', -1) do
      delete liked_hotel_url(@liked_hotel)
    end

    assert_redirected_to liked_hotels_url
  end
end
