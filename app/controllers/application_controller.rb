# app/controllers/applications_controller.rb
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_job, except: [:index]  # Only set job for actions that require it (create, new, edit, etc.)
	
  def index
    @applications = Application.all  # If you want to show all applications, not just job-specific ones
  end

  def show
    @application = @job.applications.find(params[:id])
  end

  def new
    @application = @job.applications.new
  end

  def create
    @application = @job.applications.new(application_params)
    if @application.save
      redirect_to job_applications_path(@job), notice: 'Application successfully submitted!'
    else
      render :new
    end
  end

  def edit
    @application = @job.applications.find(params[:id])
  end

  def update
    @application = @job.applications.find(params[:id])
    if @application.update(application_params)
      redirect_to job_application_path(@job, @application), notice: 'Application updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @application = @job.applications.find(params[:id])
    @application.destroy
    redirect_to job_applications_path(@job), notice: 'Application deleted successfully.'
  end

  private

  def set_job
    @job = Job.find(params[:job_id])  # Ensures you have access to the job through job_id
  end

  def application_params
    params.require(:application).permit(:applicant_name, :cover_letter)
  end
end
