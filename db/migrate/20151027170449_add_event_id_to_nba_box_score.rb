class AddEventIdToNbaBoxScore < ActiveRecord::Migration
  def change
    add_column :nba_box_scores, :event_id, :integer
  end
end
