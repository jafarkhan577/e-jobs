# app/models/application.rb
class Application < ApplicationRecord
  belongs_to :job

  validates :applicant_name, presence: true
  validates :cover_letter, presence: true
end
