require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest

  test "should display welcome page" do
    get root_path
    assert_response :success
  end

  test "should report error" do
    # some_undefined_variable is not defined elsewhere in the test case
    assert_raises(NameError) do
      some_undefined_variable
    end
  end

end
