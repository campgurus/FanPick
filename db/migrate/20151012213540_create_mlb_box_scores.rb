class CreateMlbBoxScores < ActiveRecord::Migration
  def change
    create_table :mlb_box_scores do |t|
      t.string :last_name
      t.string :first_name
      t.string :display_name
      t.string :position
      t.integer :bat_order
      t.integer :sub_bat_order
      t.integer :singles
      t.integer :doubles
      t.integer :triples
      t.integer :hits
      t.integer :rbi
      t.integer :sacrifices
      t.integer :at_bats
      t.integer :plate_appearances
      t.integer :home_runs
      t.integer :sac_flies
      t.integer :sac_hits
      t.integer :stolen_bases
      t.integer :caught_stealing
      t.integer :rbi_with_two_outs
      t.integer :total_bases
      t.integer :runs
      t.integer :walks
      t.integer :strike_outs
      t.integer :left_on_base
      t.integer :hit_by_pitch
      t.string :team_abbreviation
      t.float :avg
      t.float :obp
      t.float :slg
      t.float :ops
      t.float :at_bats_per_home_run
      t.float :at_bats_per_rbi
      t.float :walk_rate
      t.float :plate_appearances_per_rbi
      t.float :plate_appearances_per_home_run
      t.integer :extra_base_hits
      t.float :stolen_base_average
      t.float :strike_out_rate
      t.string :ops_string
      t.string :slg_string
      t.string :obp_string
      t.string :avg_string
      t.string :batting_highlights

      t.timestamps null: false
    end
  end
end
