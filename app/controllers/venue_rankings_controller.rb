class VenueRankingsController < ApplicationController
  def new
    # @venue_ranking = VenueRanking.new
    @event = Event.find(params[:event_id])
    @userevent = UserEvent.where(user: current_user).where(event: params[:event_id])
    # @response = GetRestaurants.new(current_user, @event).call
    if (UserEvent.where(event: @event.id).count) == 2
      @venues = VenueRanking.select("name").where(event: @event)
    end
  end

  def show
    @venue_ranking = VenueRanking.new
  end

  def create
    @venueranking = VenueRanking.new(venue_ranking_params)
    if @venueranking.valid?
      i = 1
      n = 1
      params.dig(:venue_rankings, :ranking).gsub(/["\"]/,'').split(",").each do |rest|
      @venueranking = VenueRanking.new(venue_ranking_params)
      @venueranking.rank = i
      @venueranking.place_name = rest
      @venueranking.note = n.round(2)
      @venueranking.save!
      i += 1
      n -= 0.20
      end
      UserEvent.create(user_id: current_user.id , event_id: @venueranking.event.id)
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
    update(@venueranking.event)
  end

  def update(event)
    case event.status(current_user)
    when 'canceled'
      EventChannel.broadcast_to(
        event.other_user(current_user),
        render_to_string(partial: "events/cancel_alert", locals: { event: event })
      )
    when 'paired'
      EventChannel.broadcast_to(
        event.other_user(current_user),
        render_to_string(partial: "events/pairing_alert", locals: { event: event })
      )
    end
    #Si ils sont deux dans l'user event et qu'il rentre ici c'est qu'il a submit son formulaire
    # Dans ce cas on récupère le best compromise des deux
    if (event.users.count) == 2
      # if (UserEvent.where(event: event.id).count) == 2
      @venues = VenueRanking.select("place_name, sum(note) as note").where(event: event.id).group("place_name")

      @max_note = @venues.sort_by { |venue| venue.note}.last
      event.venue = @max_note.place_name
      address = Venue.select("address").find_by(name: @max_note.place_name)
      event.address = address.address
      event.save!

      redirect_to dashboard_path
    else
      redirect_to dashboard_path
    end
  end

  private

  def venue_ranking_params
    params.require(:venue_rankings).permit(:rank, :event_id, :user_id )
  end

end
