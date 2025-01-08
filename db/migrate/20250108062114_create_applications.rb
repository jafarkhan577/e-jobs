class CreateApplications < ActiveRecord::Migration[8.0]
  def change
    create_table :applications do |t|
      t.string :applicant_name
      t.text :cover_letter
      t.references :job, foreign_key: true

      t.timestamps
    end
  end
end
