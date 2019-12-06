require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest

  test "should display admin page" do
    get adminpage_path
    assert_response :success
  end

  test "should display admin dashboard page" do
    get rails_admin_path
    assert_response :success
  end

  test "should report error" do
    # some_undefined_variable is not defined elsewhere in the test case
    assert_raises(NameError) do
      some_undefined_variable
    end
  end

end
