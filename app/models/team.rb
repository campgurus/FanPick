class Team < ActiveRecord::Base
  validates :team_id, :uniqueness => true
end
