require "application_system_test_case"

class ReportErrorsTest < ApplicationSystemTestCase
  setup do
    @report_error = report_errors(:one)
  end

  test "visiting the index" do
    visit report_errors_url
    assert_selector "h1", text: "Report Errors"
  end

  test "creating a Report error" do
    visit report_errors_url
    click_on "New Report Error"

    fill_in "Errormessage", with: @report_error.errormessage
    fill_in "User", with: @report_error.user_id
    click_on "Create Report error"

    assert_text "Report error was successfully created"
    click_on "Back"
  end

  test "updating a Report error" do
    visit report_errors_url
    click_on "Edit", match: :first

    fill_in "Errormessage", with: @report_error.errormessage
    fill_in "User", with: @report_error.user_id
    click_on "Update Report error"

    assert_text "Report error was successfully updated"
    click_on "Back"
  end

  test "destroying a Report error" do
    visit report_errors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Report error was successfully destroyed"
  end
end
