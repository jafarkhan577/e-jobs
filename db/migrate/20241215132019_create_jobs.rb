class CreateJobs < ActiveRecord::Migration[8.0]
  def change
    create_table :jobs, if_not_exists: true do |t|
      t.string :title
      t.text :description
      t.string :location
      t.string :category

      t.timestamps
    end
  end
end
