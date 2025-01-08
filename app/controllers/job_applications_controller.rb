class JobApplicationsController < ApplicationController
    before_action :authenticate_user!
  
    def create
      job = Job.find(params[:job_id])
      application = job.job_applications.new(user: current_user, cover_letter: params[:cover_letter])
  	
      if application.save
        ApplicationMailer.job_application_email(application).deliver_now
        redirect_to jobs_path, notice: "Successfully applied for #{job.title}!"
      else
        redirect_to job_path(job), alert: "Failed to apply for the job. Please try again."
      end

      if application.save
        redirect_to jobs_path, notice: "Successfully applied for #{job.title}!"
      else
        redirect_to job_path(job), alert: "Failed to apply for the job. Please try again."
      end
    end
  
    def index
      @applications = current_user.job_applications.includes(:job)
    end
  end
  