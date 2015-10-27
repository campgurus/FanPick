class Event < ActiveRecord::Base
  validates :event_id, :uniqueness => true
  has_many :mlb_box_scores
  has_many :nba_box_scores
  has

# http://stackoverflow.com/questions/14374695/saving-external-json-to-db-with-rails
#   def self.save_data_from_api
# 	  response = HTTParty.get('URI')
# 	  user_data = JSON.parse(response)
# 	  users = user_data.map do |line|
# 	    u = User.new
# 	    u.external_id = line['user']['id']
# 	    # set name value however you want to do that
# 	    u.save
# 	    u
# 	  end
# 	  users.select(&:persisted?)
#   end
end
