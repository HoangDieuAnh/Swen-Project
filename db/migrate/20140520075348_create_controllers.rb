class CreateControllers < ActiveRecord::Migration
  def change
    create_table :controllers do |t|
      t.string :ticket

      t.timestamps
    end
  end
end
