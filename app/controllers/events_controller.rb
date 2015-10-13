class EventsController < ApplicationController
  def index
  	@date = Date.today
  	counter = 0
  	if Event.count == 0 # get all events for the next 7 days if the Events tale is blank
  		while counter < 8 do
		  	games = Xmlstats.events(@date - counter.day)
		  	games.each do |event|
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
	  			save_mlb_box_scores(event)
	  		end
		  	counter += 1
	  	end
	  else
	  	for i in (1..7) do
		  	games = Xmlstats.events(@date - i)
	  		games.each do |event|
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
		  		if event.event_status == "completed"
		  			save_mlb_box_scores(event)
		  		end
		  	end
		  end
  	end 	
    @events = Event.all
    @past_events = Event.all.select{|e| e.event_status == "completed"}
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