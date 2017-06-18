class UniqueUsernameForUser < ActiveRecord::Migration[5.1]
  def change
    add_index :users, [:user_type, :username], unique: true
  end
end
