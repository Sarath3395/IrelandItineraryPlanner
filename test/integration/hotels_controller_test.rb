require 'test_helper'

class HotelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hotel = hotels(:one)
  end

  # called after every single test
  teardown do
    # when controller is using cache it may be a good idea to reset it afterwards
    Rails.cache.clear
  end

  test "should show hotel" do
    # Reuse the @article instance variable from setup
    get hotel_path(@hotel)
    assert_response :success
  end

  test "should destroy hotel" do
    assert_difference('Hotel.count', -1) do
      delete hotel_path(@hotel)
    end

    assert_redirected_to hotels_path
  end

  test "should update article" do
    patch hotel_path(@hotel), params: { hotel: { name: "updated" } }

    assert_redirected_to hotel_path(@hotel)
    # Reload association to fetch updated data and assert that title is updated.
    @hotel.reload
    assert_equal "updated", @hotel.name
  end
end
