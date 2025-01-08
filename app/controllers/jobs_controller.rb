# app/controllers/jobs_controller.rb
class JobsController < ApplicationController
  before_action :authenticate_user!

  def index
    @jobs = Job.all
    @jobs = @jobs.where("title ILIKE ?", "%#{params[:search]}%") if params[:search].present?
    @jobs = @jobs.where("location ILIKE ?", "%#{params[:location]}%") if params[:location].present?
    @jobs = @jobs.order(created_at: :desc).page(params[:page]).per(10)
  	@jobs = Job.page(params[:page]).per(10)
  end

  def show
    @job = Job.find(params[:id])
    @user = User.find_by(id: @job.user_id)
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to jobs_path, notice: 'Job created successfully!'
    else
      render :new
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :description)
  end
end
