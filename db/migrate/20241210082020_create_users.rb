# db/migrate/XXXXXX_create_jobs.rb
class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
