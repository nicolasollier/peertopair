class VenueRankingsController < ApplicationController
  def new
    # @venue_ranking = VenueRanking.new
    @event = Event.find(params[:event_id])
    @userevent = UserEvent.where(user: current_user).where(event: params[:event_id])
    # @response = GetRestaurants.new(current_user, @event).call
    if (UserEvent.where(event: @event.id).count) == 2
      @venues = VenueRanking.select("name").where(event: @event)
      raise
    end
  end

  def show
    @venue_ranking = VenueRanking.new
  end

  def create

    if params.user_id

      raise

    else
      @event = current_user.events.last
      i = 1
      n = 1
      #Permet de looper sur la réponse d-none de la modal avec les restaurants
      params.dig(:venue_rankings, :ranking).gsub(/["\"]/,'').split(",").each do |rest|
        @venueranking = VenueRanking.new
        @venueranking.user = current_user
        @venueranking.event = @event
        @venueranking.rank = i
        @venueranking.place_name = rest
        @venueranking.note = n.round(2)
        @venueranking.save!
        i += 1
        n -= 0.20
      end
    end

    update()

  end

  def update
    #Si ils sont deux dans l'user event et qu'il rentre ici c'est qu'il a submit son formulaire
    # Dans ce cas on récupère le best compromise des deux
    if (UserEvent.where(event: @event.id).count) == 2
      @venues = VenueRanking.select("place_name, sum(note) as note").where(event: @event.id).where(user: current_user).group("place_name")
      @max_note = @venues.sort_by { |venue| venue.note}.last
      @event.venue = @max_note.place_name
      address = Venue.select("address").find_by(name: @max_note.place_name)
      @event.address = address.address
      @event.save!
    else

    end
  end
end
