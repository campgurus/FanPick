class Event < ActiveRecord::Base
  validates :event_id, :uniqueness => true
end
