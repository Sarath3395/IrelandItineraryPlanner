require 'test_helper'

class LikedTransportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @liked_transport = liked_transports(:one)
  end

  test "should get index" do
    get liked_transports_url
    assert_response :success
  end

  test "should get new" do
    get new_liked_transport_url
    assert_response :success
  end

  test "should create liked_transport" do
    assert_difference('LikedTransport.count') do
      post liked_transports_url, params: { liked_transport: { transport_id: @liked_transport.transport_id, user_id: @liked_transport.user_id } }
    end

    assert_redirected_to liked_transport_url(LikedTransport.last)
  end

  test "should show liked_transport" do
    get liked_transport_url(@liked_transport)
    assert_response :success
  end

  test "should get edit" do
    get edit_liked_transport_url(@liked_transport)
    assert_response :success
  end

  test "should update liked_transport" do
    patch liked_transport_url(@liked_transport), params: { liked_transport: { transport_id: @liked_transport.transport_id, user_id: @liked_transport.user_id } }
    assert_redirected_to liked_transport_url(@liked_transport)
  end

  test "should destroy liked_transport" do
    assert_difference('LikedTransport.count', -1) do
      delete liked_transport_url(@liked_transport)
    end

    assert_redirected_to liked_transports_url
  end
end
