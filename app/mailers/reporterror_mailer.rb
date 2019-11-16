class ReporterrorMailer < ApplicationMailer
  def new_report_error_email
    @error = params[:report_error]
    email = User.find_by_id(@error.user_id)
    mail(to: email.email, subject: "An Error is Assigned to you!!!")
  end
end
