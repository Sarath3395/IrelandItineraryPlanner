require 'test_helper'

class HotelTest < ActiveSupport::TestCase
  test "should  save when hotel name is not empty" do
    hotel = Hotel.new
    hotel.name = "test"
    assert_equal(false,hotel.save)
  end
  test "should  not save when hotel name is not empty" do
    hotel = Hotel.new
    assert_equal(false,hotel.save)
  end
  test "should   save when hotel name is not empty and other value are empty" do
    hotel = Hotel.new
    hotel.name = "test"
    assert_equal(false,hotel.save)
  end
  test "should  not save when hotel name is not empty and other value are provided" do
    hotel = Hotel.new
    hotel.roomtype = "single"
    hotel.coordinates = "2343452345"
    hotel.price = "21"
    hotel.fromdate ="11-11-2019"
    hotel.todate = "13-11-2019"
    assert_equal(false,hotel.save)
  end
end
