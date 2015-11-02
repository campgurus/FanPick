class AddPlayerIdToNbaBoxScore < ActiveRecord::Migration
  def change
    add_column :nba_box_scores, :player_id, :integer
  end
end
