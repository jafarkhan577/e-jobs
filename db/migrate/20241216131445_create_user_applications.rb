class CreateUserApplications < ActiveRecord::Migration[8.0]
  def change
    create_table :user_applications do |t|
      t.string :applicant_name

      t.timestamps
    end
  end
end