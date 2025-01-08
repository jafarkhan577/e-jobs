class JobApplication < ApplicationRecord
  belongs_to :user
  belongs_to :job

  # Enum declaration for status field
  enum status: { applied: 'applied', interview: 'interview', hired: 'hired', rejected: 'rejected' }

  # Validations
  validates :user_id, :job_id, presence: true
end
