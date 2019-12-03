require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  test "should  save when Location name is not empty" do
    location = Location.new
    location.name = "test"
    assert_equal(true,location.save)
  end
  test "should  not save when Location name is empty" do
    location = Location.new
    assert_equal(false,location.save)
  end
end
