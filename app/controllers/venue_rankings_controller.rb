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

  def create
    @event = current_user.events.last
    i = 1
    n = 1
    params.dig(:venue_rankings, :ranking).gsub(/["\"]/,'').split(",").each do |rest|
      @venueranking = VenueRanking.new
      @venueranking.user = current_user
      @venueranking.event = @event
      @venueranking.rank = i
      @venueranking.note = n.round(2)
      @venueranking.save!
      i += 1
      n -= 0.20
    end
  end
end
