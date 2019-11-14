require 'test_helper'

class ReportErrorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @report_error = report_errors(:one)
  end

  test "should get index" do
    get report_errors_url
    assert_response :success
  end

  test "should get new" do
    get new_report_error_url
    assert_response :success
  end

  test "should create report_error" do
    assert_difference('ReportError.count') do
      post report_errors_url, params: { report_error: { errormessage: @report_error.errormessage, user_id: @report_error.user_id } }
    end

    assert_redirected_to report_error_url(ReportError.last)
  end

  test "should show report_error" do
    get report_error_url(@report_error)
    assert_response :success
  end

  test "should get edit" do
    get edit_report_error_url(@report_error)
    assert_response :success
  end

  test "should update report_error" do
    patch report_error_url(@report_error), params: { report_error: { errormessage: @report_error.errormessage, user_id: @report_error.user_id } }
    assert_redirected_to report_error_url(@report_error)
  end

  test "should destroy report_error" do
    assert_difference('ReportError.count', -1) do
      delete report_error_url(@report_error)
    end

    assert_redirected_to report_errors_url
  end
end
