class AddStatusToJobApplications < ActiveRecord::Migration[8.0]
  def change
    add_column :job_applications, :status, :string
  end
end