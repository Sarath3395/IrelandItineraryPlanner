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
  test "should report error" do
    # some_undefined_variable is not defined elsewhere in the test case
    assert_raises(NameError) do
      some_undefined_variable
    end
  end
end
