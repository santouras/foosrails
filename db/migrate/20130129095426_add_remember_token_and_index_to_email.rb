class AddRememberTokenAndIndexToEmail < ActiveRecord::Migration
  def change
    add_column :users, :remember_token, :string

    add_index :users, :email, unique: true
    add_index :users, :remember_token
  end
end
