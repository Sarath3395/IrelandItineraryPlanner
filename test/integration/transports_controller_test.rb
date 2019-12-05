require 'test_helper'

class TransportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transport = transports(:one)
  end

  # called after every single test
  teardown do
    # when controller is using cache it may be a good idea to reset it afterwards
    Rails.cache.clear
  end

  test "should show transport" do
    # Reuse the @article instance variable from setup
    get transport_url(@transport)
    assert_response :success
  end

  test "should destroy transport" do
    assert_difference('Transport.count', -1) do
      delete transport_url(@transport)
    end

    assert_redirected_to transports_path
  end

  test "should update transport" do
    patch transport_url(@transport), params: { transport: { name: "updated" } }

    assert_redirected_to transport_path(@transport)
    # Reload association to fetch updated data and assert that title is updated.
    @transport.reload
    assert_equal "updated", @transport.name
  end
end
