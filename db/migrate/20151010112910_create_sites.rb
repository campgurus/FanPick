class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :city
      t.string :state
      t.integer :capacity
      t.string :surface
      t.string :name

      t.timestamps null: false
    end
  end
end
