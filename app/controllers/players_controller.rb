class PlayersController < ApplicationController
  def show
  	@player = Player.find(params[:id])
  	@box_scores = NbaBoxScore.where()
  end
end
