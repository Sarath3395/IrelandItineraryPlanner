require 'test_helper'

class LikedHotelTest < ActiveSupport::TestCase

  test "should not save without the user_id" do
    likedhotel = LikedHotel.new
    likedhotel.hotel_id = 1
    #member.password = "dghsdg"
    assert_equal(false,likedhotel.save)
  end
  test "should not save without the hotel_id" do
    likedhotel = LikedHotel.new
    likedhotel.user_id = 1
    #member.password = "dghsdg"
    assert_equal(false,likedhotel.save)
  end
  test "should not save without non numerical value in hotel_id" do
    likedhotel = LikedHotel.new
    likedhotel.hotel_id = "test"
    #member.password = "dghsdg"
    assert_equal(false,likedhotel.save)
  end
  test "should not save non numerical value in user_id" do
    likedhotel = LikedHotel.new
    likedhotel.user_id = "test"
    #member.password = "dghsdg"
    assert_equal(false,likedhotel.save)
  end
  test "should not save empty value to liked restaurant" do
    likedhotel = LikedHotel.new
    assert_equal(false,likedhotel.save)
  end
  test "should not save non numerical value in user_id and hotel_id" do
    likedhotel = LikedHotel.new
    likedhotel.user_id = "test"
    likedhotel.hotel_id = "test"

    assert_equal(false,likedhotel.save)
  end
  test "should  not save with alphanumerical value in user_id and hotel_id" do
    likedhotel = LikedHotel.new
    likedhotel.user_id = "1sdf"
    likedhotel.hotel_id = "1asdf"

    assert_equal(false,likedhotel.save)
  end
end

