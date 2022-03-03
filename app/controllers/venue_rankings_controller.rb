class VenueRankingsController < ApplicationController
  def new
    # @venue_ranking = VenueRanking.new
    @event = Event.find(params[:event_id])
    @userevent = UserEvent.where(user: current_user).where(event: params[:event_id])
    @response = GetRestaurants.new(current_user, @event).call
  end

  def show
    @venue_ranking = VenueRanking.new
  end
end
