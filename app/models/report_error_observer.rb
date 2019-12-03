require 'my_logger'
class ReportErrorObserver < ActiveRecord::Observer
  def after_create(record)
    tmp = ReportError.find_by_id(record.id)
    user = User.find_by_id(record.id)
    tmp.assignstatus = "Successfully Added to User_id#{record.user_id}"
    tmp.save
    puts "This error #{record} is assigned to this user_id#{user.name}."

    ReporterrorMailer.with(report_error: record).new_report_error_email.deliver_later
# use the MyLogger instance method to retrieve the single instance/object of the class

  end
end

