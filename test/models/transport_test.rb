require 'test_helper'

class TransportTest < ActiveSupport::TestCase
  test "should  save when transport name is not empty" do
    transport = Transport.new
    transport.name = "test"
    assert_equal(false,transport.save)
  end
  test "should  not save when transport name is not empty" do
    transport = Transport.new
    assert_equal(false,transport.save)
  end
  test "should   save when transport name is not empty and other value are empty" do
    transport = Transport.new
    transport.name = "test"
    assert_equal(false,transport.save)
  end
  test "should  not save when transport name is not empty and other value are provided" do
    transport = Transport.new
    transport.transporttype = "tram"

    assert_equal(false,transport.save)
  end
end
