class EventsController < ApplicationController
  def index
  	@date = Date.today
  	counter = 0
  	game_count = 0
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
end