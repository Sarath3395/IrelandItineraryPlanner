require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_customer_order_url(@customer)
    assert_response :success
#assert_not_nil assigns(:order)
  end
end
