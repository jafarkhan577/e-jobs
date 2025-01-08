class CreateNotifications < ActiveRecord::Migration[8.0]
  def change
    create_table :notifications do |t|
      t.references :user, foreign_key: true
      t.string :message
      t.boolean :read_status

      t.timestamps
    end
  end
end
