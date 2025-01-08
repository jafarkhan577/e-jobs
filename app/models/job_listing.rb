class JobListing < ApplicationRecord
    validates :title, :description, :location, :category, presence: true
  end
  