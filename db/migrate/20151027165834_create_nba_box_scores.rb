class CreateNbaBoxScores < ActiveRecord::Migration
  def change
    create_table :nba_box_scores do |t|
      t.string :position
      t.integer :minutes
      t.integer :points
      t.integer :assists
      t.integer :turnovers
      t.integer :steals
      t.integer :blocks
      t.integer :rebounds
      t.integer :field_goals_attempted
      t.integer :field_goals_made
      t.integer :three_point_field_goals_attempted
      t.integer :three_point_field_goals_made
      t.integer :free_throws_attempted
      t.integer :free_throws_made
      t.integer :defensive_rebounds
      t.integer :offensive_rebounds
      t.integer :personal_fouls
      t.integer :team_id
      t.boolean :is_starter
      t.float :field_goal_percentage
      t.float :three_point_percentage
      t.float :free_throw_percentage
      t.string :field_goal_percentage_string
      t.string :three_point_field_goal_percentage_string
      t.string :free_throw_percentage_string

      t.timestamps null: false
    end
  end
end
