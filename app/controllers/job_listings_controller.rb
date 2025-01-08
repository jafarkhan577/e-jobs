class JobListingsController < ApplicationController
    before_action :set_job_listing, only: [:show, :edit, :update, :destroy]
  
    # GET /job_listings
    def index
      @job_listings = JobListing.all
    end
  
    # GET /job_listings/:id
    def show
    end
  
    # GET /job_listings/new
    def new
      @job_listing = JobListing.new
    end
  
    # POST /job_listings
    def create
      @job_listing = JobListing.new(job_listing_params)
  
      if @job_listing.save
        redirect_to @job_listing, notice: 'Job listing was successfully created.'
      else
        render :new
      end
    end
  
    # GET /job_listings/:id/edit
    def edit
    end
  
    # PATCH/PUT /job_listings/:id
    def update
      if @job_listing.update(job_listing_params)
        redirect_to @job_listing, notice: 'Job listing was successfully updated.'
      else
        render :edit
      end
    end
  
    # DELETE /job_listings/:id
    def destroy
      @job_listing.destroy
      redirect_to job_listings_url, notice: 'Job listing was successfully destroyed.'
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_job_listing
        @job_listing = JobListing.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def job_listing_params
        params.require(:job_listing).permit(:title, :description, :location, :category)
      end
  end
  