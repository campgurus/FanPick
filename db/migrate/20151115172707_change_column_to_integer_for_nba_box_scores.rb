class ChangeColumnToIntegerForNbaBoxScores < ActiveRecord::Migration
  def up
    change_table :nba_box_scores do |t|
      t.change :event_id, :string
    end
  end
 
  def down
    change_table :nba_box_scores do |t|
      t.change :event_id, :integer
    end
  end
end
