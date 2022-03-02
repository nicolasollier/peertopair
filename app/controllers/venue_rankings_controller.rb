class VenueRankingsController < ApplicationController
  def new
    @venue_ranking = VenueRanking.new
    @event = Event.find(params[:event_id])
    @userevents = UserEvent.where("event_id = ?", params[:id])
    @response = GetRestaurants.new(current_user, @event).call
  end

  def show
    @venue_ranking = VenueRanking.new
  end
end
