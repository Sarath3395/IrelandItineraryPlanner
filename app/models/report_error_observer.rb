class ReportErrorObserver < ActiveRecord::Observer
  def after_create(record)
    tmp = ReportError.find_by_id(record.id)
    tmp.assignstatus = "Successfully Added to User_id#{record.user_id}"
    tmp.save

    ReporterrorMailer.with(report_error: record).new_report_error_email.deliver_later
# use the ReportedErrorsLogger instance method to retrieve the single instance/object of the class

  end
end

