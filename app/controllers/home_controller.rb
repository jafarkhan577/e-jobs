class HomeController < ApplicationController
  # Before action to authenticate user for index action
  before_action :authenticate_user!, only: [:index]

  # Index action to display the homepage content
  def index
    @user = current_user # Get the current logged-in user
    @recent_jobs = Job.all.order(created_at: :desc).limit(5) # Display 5 most recent jobs
  end

  # About action for informational page
  def about
    @about_us_content = "We are a platform connecting job seekers and employers."
  end

  # Contact action for user inquiries
  def contact
    @contact_info = "Email us at support@example.com"
  end

  # Other actions...
end
