require 'test_helper'

class ReportErrorTest < ActiveSupport::TestCase
  test "should not save empty error message" do
    reporterror = ReportError.new
    #member.password = "dghsdg"
    assert_equal(false,reporterror.save)
  end
  test "should  save  error message with some value" do
    reporterror = ReportError.new
    reporterror.errormessage = "test error message"
    assert_equal(true,reporterror.save)
  end
  test "should report error" do
    # some_undefined_variable is not defined elsewhere in the test case
    assert_raises(NameError) do
      some_undefined_variable
    end
  end
end
