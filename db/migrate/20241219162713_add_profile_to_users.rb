class AddProfileToUsers < ActiveRecord::Migration[8.0]
  def change
    # Add columns only if they don't already exist
    add_column :users, :name, :string unless column_exists?(:users, :name)
    add_column :users, :phone_number, :string unless column_exists?(:users, :phone_number)
    add_column :users, :resume, :string unless column_exists?(:users, :resume)
  end
end
