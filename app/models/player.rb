class Player < ActiveRecord::Base
	has_many :nba_box_scores
	# Overriding the save function so as to update the average every time the object gets saved
  def save
    self.games_played = NbaBoxScore.where(player_id: self.id).count
    t.string   "avg_minutes"
    t.float    "fg_made"
    t.float    "fg_attempted"
    t.float    "threes_made"
    t.float    "threes_attempted"
    t.float    "threes_percentage"
    t.float    "ft_made"
    t.float    "ft_attempted"
    t.float    "ft_percentage"
    t.float    "oreb"
    t.float    "dreb"
    t.float    "rebounds"
    t.float    "assists"
    t.float    "turnovers"
    t.float    "steals"
    t.float    "blocks"
    t.float    "fouls"
    t.float    "points"
    self.average = (assignment1 + assignment2) / 2.0;
    super   # calls the rails save function to store our object to the database
  end
end
