require 'test_helper'

class TopratedControllerTest < ActionDispatch::IntegrationTest

  test "should display top rated page" do
    get toprated_path
    assert_response :success
  end

  test "should report error" do
    # some_undefined_variable is not defined elsewhere in the test case
    assert_raises(NameError) do
      some_undefined_variable
    end
  end

end
