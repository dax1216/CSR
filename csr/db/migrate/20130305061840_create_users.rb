class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, unique: true
      t.string :password_digest
      t.string :first_name
      t.string :last_name
     t.string :email, unique: true

      t.timestamps
    end
  end
end
