class NotificationMailer < ApplicationMailer
  def job_application_notification(application)
    @application = application
    @job_listing = @application.job_listing
    @user = @application.user

    mail(to: @user.email, subject: 'Your Application for Job')
  end
end
