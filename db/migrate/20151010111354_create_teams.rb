class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :team_id
      t.string :abbreviation
      t.boolean :active
      t.string :first_name
      t.string :last_name
      t.string :conference
      t.string :division
      t.string :site_name
      t.string :city
      t.string :state
      t.string :full_name

      t.timestamps null: false
    end
  end
end
