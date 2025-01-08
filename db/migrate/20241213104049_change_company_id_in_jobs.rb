class ChangeCompanyIdInJobs < ActiveRecord::Migration[8.0]
  def change
    change_column_null :jobs, :company_id, true  # Allows NULL for company_id
  end
end
