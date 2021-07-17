class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :avatar
      t.string :password_digest
      t.string :refresh_token
      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :refresh_token, unique: true
  end
end
