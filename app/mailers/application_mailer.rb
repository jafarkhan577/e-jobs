class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@example.com'
  layout 'mailer'

  def application_status_changed(user, job, status)
    @user = user
    @job = job
    @status = status
    mail(to: @user.email, subject: "Your application status has been updated")
  end
end
