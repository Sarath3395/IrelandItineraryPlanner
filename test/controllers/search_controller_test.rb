require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest

  test "should display search result page" do
    get search_path
    assert_response :success
  end

  test "should report error" do
    # some_undefined_variable is not defined elsewhere in the test case
    assert_raises(NameError) do
      some_undefined_variable
    end
  end

end
