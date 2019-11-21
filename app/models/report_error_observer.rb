require 'my_logger'
class ReportErrorObserver < ActiveRecord::Observer
  def after_create(record)
    tmp = ReportError.find_by_id(record.id)
    tmp.assignstatus = "Successfully Added to User_id#{record.user_id}"
    tmp.save
    puts "This error #{record} is assigned to this user_id#{record.user_id}."

    ReporterrorMailer.with(report_error: record).new_report_error_email.deliver_later
# use the MyLogger instance method to retrieve the single instance/object of the class
    @logger = MyLogger.instance
# use the logger to log/record a message about the updated car
    @logger.logInformation("###############Observer Demo:#")
    @logger.logInformation("Error Reported
#{record.errormessage}
has been assigned to #{record.user_id}")
    @logger.logInformation("##############################")
  end
end

