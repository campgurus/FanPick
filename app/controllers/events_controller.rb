class EventsController < ApplicationController
  def index
  	date = Date.today
  	@events = Xmlstats.events(date)
  end
end
