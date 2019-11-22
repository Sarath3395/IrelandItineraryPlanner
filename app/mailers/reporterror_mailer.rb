class ReporterrorMailer < ApplicationMailer
  def new_report_error_email
    @error = params[:report_error]
    email = User.find_by_id(@error.user_id)
    logger = MyLogger.instance
    mail(to: email.email, subject: "An Error is Assigned to you!!!")
    logger.logInformation("#{Time.now} Email has sent regarding: #{@error.errormessage} to this email id: #{email.email}")
  end
end
