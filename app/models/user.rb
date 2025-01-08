class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  # Add additional validations if necessary
  validates :email, presence: true, uniqueness: true

  # Association with notifications
  has_many :notifications, dependent: :destroy
  has_one_attached :resume
  has_many :job_applications
  has_many :jobs, through: :job_applications
end
