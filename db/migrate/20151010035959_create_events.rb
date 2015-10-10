class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_status
      t.string :sport
      t.string :start_date_time
      t.string :season_type
      t.integer :away_team_id
      t.integer :home_team_id
      t.integer :site_id
      t.integer :away_points_scored
      t.integer :home_points_scored

      t.timestamps null: false
    end
  end
end
