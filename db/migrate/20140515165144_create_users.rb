class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :degree
      t.integer :year
      t.string :encrypted_password
      t.timestamps
    end
  end
end
