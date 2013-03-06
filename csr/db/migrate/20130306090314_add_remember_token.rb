class AddRememberToken < ActiveRecord::Migration
  def up
  end

  def down
  end

  def change
    add_column :users, :remember_token, :string
    add_index  :users, :remember_token
  end
end
