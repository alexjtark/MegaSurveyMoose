class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :password_digest
      t.text :bio
      t.string :email
      t.timestamps
    end
  end
end
