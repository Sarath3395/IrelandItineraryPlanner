require 'test_helper'
require 'reporterror_mailer'
class ReporterrorMailerTest < ActionMailer::TestCase
  test "report_error" do
    # Create the email and store it for further assertions

    email = ReporterrorMailer.new_report_error_email.deliver_now

    assert_not ActionMailer::Base.deliveries.empty?

    assert_equal ["sarath3395@gmail.com"], email.from

    assert_equal "Error Reported!", email.subject

  end
end
