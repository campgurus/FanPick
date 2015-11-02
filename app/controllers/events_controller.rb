class EventsController < ApplicationController
  def index
  	for i in 0..7
	  	@date = Date.today - i.day
	  	games = Xmlstats.events(@date, :nba)
	  	games.each do |event|
	  		game_found = Event.find_by_event_id(event.event_id)
	  		if game_found
	  			game_found.update_attributes(
				    away_points_scored: event.away_points_scored,
				    home_points_scored: event.home_points_scored,
		        event_status: event.event_status
	  				)
	  			game_found.save 
	  		else
		      away_team_create(event)
		      home_team_create(event)
		      site_create(event)
		  		Event.create(
		        event_status: event.event_status,
				    sport: event.sport,
				    start_date_time: event.start_date_time,
				    season_type: event.season_type,
				    away_team_id: Team.where(team_id: event.away_team.team_id).first.id,
				    home_team_id: Team.where(team_id: event.home_team.team_id).first.id,
				    site_id: Site.where(name: event.site.name).first.id,
				    away_points_scored: event.away_points_scored,
				    home_points_scored: event.home_points_scored,
				    event_id: event.event_id
		  		)
		  	end
		  	if event.event_status == "completed"
		  		if event.sport == 'mlb'
		  			save_mlb_box_scores(event)
		  		elsif event.sport == 'nba'
		  			save_nba_box_scores(event)
		  		end
		  	end
		  end
		end
    @events = Event.all
    @nba_events = Event.select{|e| e.sport == "NBA"}
    @nba_events_scheduled = @nba_events.select{|e| e.event_status == 'scheduled'}
    @past_events = Event.all.select{|e| e.event_status == "completed"}
    @past_nba_events = @nba_events.select{|e| e.event_status == "completed"}
  end

  def show
  	@event = Event.find(params[:id])
  end

  def away_team_create(event)
  	Team.create(
      team_id: event.away_team.team_id,
      abbreviation: event.away_team.abbreviation,
      active: event.away_team.active,
      first_name: event.away_team.first_name,
      last_name: event.away_team.last_name,
      conference: event.away_team.conference,
      division: event.away_team.division,
      site_name: event.away_team.site_name,
      city: event.away_team.city,
      state: event.away_team.state,
      full_name: event.away_team.full_name
    )
  end

  def home_team_create(event)
  	Team.create(
      team_id: event.home_team.team_id,
      abbreviation: event.home_team.abbreviation,
      active: event.home_team.active,
      first_name: event.home_team.first_name,
      last_name: event.home_team.last_name,
      conference: event.home_team.conference,
      division: event.home_team.division,
      site_name: event.home_team.site_name,
      city: event.home_team.city,
      state: event.home_team.state,
      full_name: event.home_team.full_name
    )
  end

  def site_create(event)
  	Site.create(
      city: event.site.city,
      state: event.site.state,
      capacity: event.site.capacity,
      # surface: event.site.surface,
      name: event.site.name
  	)	
  end

  def player_create(athlete) # finds or creates new player based on display name. qq:what about same names?
  	Player.find_or_create_by(display_name: athlete.display_name) do |r|
	    r.first_name = athlete.first_name
	    r.last_name = athlete.last_name
	  end
  end

  def save_nba_box_scores(event) #creates a box score for each home and away player for completed games
  	box_score = Xmlstats.nba_box_score(event.event_id)
  	player_stats = box_score.away_stats + box_score.home_stats # creates a single array with all players
  	player_stats.each do |player|
  		@player = player_create(player) 
	  	NbaBoxScore.create(
	  		player_id: @player.id,
	      event_id: box_score.event_id, #need to confirm that box_score.event_id == event.event_id 
	      last_name: player.last_name,
		    first_name: player.first_name,
		    display_name: player.display_name,
		    position: player.position,
		    minutes: player.minutes,
		    points: player.points,
		    assists: player.assists,
		    turnovers: player.turnovers,
		    steals: player.steals,
		    blocks: player.blocks,
		    rebounds: player.rebounds,
		    field_goals_attempted: player.field_goals_attempted,
		    field_goals_made: player.field_goals_made,
		    three_point_field_goals_attempted: player.three_point_field_goals_attempted,
		    three_point_field_goals_made: player.three_point_field_goals_made,
		    free_throws_attempted: player.free_throws_attempted,
		    free_throws_made: player.free_throws_made,
		    defensive_rebounds: player.defensive_rebounds,
		    offensive_rebounds: player.offensive_rebounds,
		    personal_fouls: player.personal_fouls,
		    team_id: player.team_id,
		    is_starter: player.is_starter,
		    field_goal_percentage: player.field_goal_percentage,
		    three_point_percentage: player.three_point_percentage,
		    free_throw_percentage: player.free_throw_percentage,
		    field_goal_percentage_string: player.field_goal_percentage_string,
		    three_point_field_goal_percentage_string: player.three_point_field_goal_percentage_string,
		    free_throw_percentage_string: player.free_throw_percentage_string
	  		)
    end 
  end

  def save_mlb_box_scores(event)
  	box_score = Xmlstats.mlb_box_score(event.event_id)
  	MlbBoxScore.create(
      event_id: box_score.event_id, #need to confirm that box_score.event_id == event.event_id 
      last_name: box_score.last_name,
	    first_name: box_score.first_name,
	    display_name: box_score.display_name,
	    position: box_score.position,
	    bat_order: box_score.bat_order,
	    sub_bat_order: box_score.sub_bat_order,
	    singles: box_score.singles,
	    doubles: box_score.doubles,
	    triples: box_score.triples,
	    hits: box_score.hits,
	    rbi: box_score.rbi,
	    sacrifices: box_score.sacrifices,
	    at_bats: box_score.at_bats,
	    plate_appearances: box_score.plate_appearances,
	    home_runs: box_score.home_runs,
	    sac_flies: box_score.sac_flies,
	    sac_hits: box_score.sac_hits,
	    stolen_bases: box_score.stolen_bases,
	    caught_stealing: box_score.caught_stealing,
	    rbi_with_two_outs: box_score.rbi_with_two_outs,
	    total_bases: box_score.total_bases,
	    runs: box_score.runs,
	    walks: box_score.walks,
	    strike_outs: box_score.strike_outs,
	    left_on_base: box_score.left_on_base,
	    hit_by_pitch: box_score.hit_by_pitch,
	    team_abbreviation: box_score.team_abbreviation,
	    avg: box_score.avg,
	    obp: box_score.obp,
	    slg: box_score.slg,
	    ops: box_score.ops,
	    at_bats_per_home_run: box_score.at_bats_per_home_run,
	    at_bats_per_rbi: box_score.at_bats_per_rbi,
	    walk_rate: box_score.walk_rate,
	    plate_appearances_per_rbi: box_score.plate_appearances_per_rbi,
	    plate_appearances_per_home_run: box_score.plate_appearances_per_home_run,
	    extra_base_hits: box_score.extra_base_hits,
	    stolen_base_average: box_score.stolen_base_average,
	    strike_out_rate: box_score.strikeout_rate,
	    ops_string: box_score.ops_string,
	    slg_string: box_score.slg_string,
	    obp_string: box_score.obp_string,
	    avg_string: box_score.avg_string,
	    batting_highlights: box_score.batting_highlights
  		)
  end
end