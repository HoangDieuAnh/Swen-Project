class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.decimal :price
      t.date :startdate
      t.date :closedate
      t.integer :maxnumber
      t.text :description

      t.timestamps
    end
  end
end
