require 'test_helper'

class LikedTransportTest < ActiveSupport::TestCase
  test "should not save without the user_id" do
    likedtransport = LikedTransport.new
    likedtransport.transport_id = 1
    #member.password = "dghsdg"
    assert_equal(false,likedtransport.save)
  end
  test "should not save without the transport_id" do
    likedtransport = LikedTransport.new
    likedtransport.user_id = 1
    #member.password = "dghsdg"
    assert_equal(false,likedtransport.save)
  end
  test "should not save non numeric value in transport_id" do
    likedtransport = LikedTransport.new
    likedtransport.transport_id = "test"
    #member.password = "dghsdg"
    assert_equal(false,likedtransport.save)
  end
  test "should not save non numerical value in user_id" do
    likedtransport = LikedTransport.new
    likedtransport.user_id = "test"
    #member.password = "dghsdg"
    assert_equal(false,likedtransport.save)
  end
  test "should not save empty value to liked transport" do
    likedtransport = LikedTransport.new
    assert_equal(false,likedtransport.save)
  end
  test "should not save non numerical value in user_id and transport_id" do
    likedtransport = LikedTransport.new
    likedtransport.user_id = "test"
    likedtransport.transport_id = "test"

    assert_equal(false,likedtransport.save)
  end
  test "should  save with alphanumerical value in user_id and transport_id" do
    likedtransport = LikedTransport.new
    likedtransport.user_id = "1sdf"
    likedtransport.transport_id = "1sdf"

    assert_equal(false,likedtransport.save)
  end
end
