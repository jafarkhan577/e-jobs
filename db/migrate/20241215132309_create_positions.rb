class CreatePositions < ActiveRecord::Migration[8.0]
  def change
    create_table :positions do |t|
      t.string :title
      t.text :description
      t.string :location
      t.string :category

      t.timestamps
    end
  end
end
