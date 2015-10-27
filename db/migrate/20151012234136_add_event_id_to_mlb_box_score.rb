class AddEventIdToMlbBoxScore < ActiveRecord::Migration
  def change
    add_column :mlb_box_scores, :event_id, :integer
  end
end
