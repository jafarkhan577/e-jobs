# frozen_string_literal: true

class AddDeviseToAdminUsers < ActiveRecord::Migration[8.0]
  def change
    # Only add the email column if it doesn't already exist
    unless column_exists?(:admin_users, :email)
      change_table :admin_users do |t|
        t.string :email, null: false, default: ""
      end
    end

    # Only add the encrypted_password column if it doesn't already exist
    unless column_exists?(:admin_users, :encrypted_password)
      change_table :admin_users do |t|
        t.string :encrypted_password, null: false, default: ""
      end
    end

    # Add other Devise fields
    unless column_exists?(:admin_users, :reset_password_token)
      change_table :admin_users do |t|
        t.string :reset_password_token
        t.datetime :reset_password_sent_at
        t.datetime :remember_created_at
      end
    end

    # Add indexes
    add_index :admin_users, :email, unique: true unless index_exists?(:admin_users, :email)
    add_index :admin_users, :reset_password_token, unique: true unless index_exists?(:admin_users, :reset_password_token)
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end
