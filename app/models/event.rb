class Event < ActiveRecord::Base
  validates :event_id, :uniqueness => true
  has_many :mlb_box_scores
end
