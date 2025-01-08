class AddDeviseToUsers < ActiveRecord::Migration[8.0]
  def self.up
    change_table :users do |t|
      ## Database authenticatable
      unless column_exists?(:users, :email)
        t.string :email, null: false, default: ""
      end
      unless column_exists?(:users, :encrypted_password)
        t.string :encrypted_password, null: false, default: ""
      end

      ## Recoverable
      unless column_exists?(:users, :reset_password_token)
        t.string   :reset_password_token
      end
      unless column_exists?(:users, :reset_password_sent_at)
        t.datetime :reset_password_sent_at
      end

      ## Rememberable
      unless column_exists?(:users, :remember_created_at)
        t.datetime :remember_created_at
      end

      ## Trackable (Uncomment if needed)
      unless column_exists?(:users, :sign_in_count)
        t.integer :sign_in_count, default: 0, null: false
      end
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable (Uncomment if needed)
      unless column_exists?(:users, :confirmation_token)
        t.string   :confirmation_token
      end
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable (Uncomment if needed)
      unless column_exists?(:users, :failed_attempts)
        t.integer  :failed_attempts, default: 0, null: false
      end
      t.string   :unlock_token
      t.datetime :locked_at
    end

    # Adding the indexes if necessary
    add_index :users, :email, unique: true unless index_exists?(:users, :email)
    add_index :users, :reset_password_token, unique: true unless index_exists?(:users, :reset_password_token)
    add_index :users, :confirmation_token, unique: true unless index_exists?(:users, :confirmation_token)
    add_index :users, :unlock_token, unique: true unless index_exists?(:users, :unlock_token)
  end

  def self.down
    # It's important to ensure we are not trying to remove fields that do not exist.
    raise ActiveRecord::IrreversibleMigration
  end
end
