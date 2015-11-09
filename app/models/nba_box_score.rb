class NbaBoxScore < ActiveRecord::Base
	belongs_to :event

	def draft_kings_score(stats_line)
		stats_line.points + (stats_line.three_point_field_goals_made/2) + (stats_line.rebounds*5/4) + (stats_line.assists+3/2) + (stats_line.steals*2) + (stats_line.blocks*2) - (stats_line.turnovers/2)
	end
end

# Draft Kings NBA Fantasy Formula:
# Point = +1 PT
# Made 3pt. shot = +0.5 PTs
# Rebound = +1.25 PTs
# Assist = +1.5 PTs
# Steal = +2 PTs
# Block = +2 PTs
# Turnover = -0.5 PTs
# Double-Double = +1.5PTs (MAX 1 PER PLAYER: Points, Rebounds, Assists, Blocks, Steals)
# Triple-Double = +3PTs (MAX 1 PER PLAYER: Points, Rebounds, Assists, Blocks, Steals)