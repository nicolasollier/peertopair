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
      @venueranking.place_name = rest
      @venueranking.note = n.round(2)
      @venueranking.save!
      i += 1
      n -= 0.20
  end
  update()
end

  def update
    #si la somme des utilisateurs pour cette id dans la table de ranking est égal a 2 alors on rentre
    if (UserEvent.where(event: @event.id).count) == 1
      #On group by les notes des deux choix de chaque user pour un restaurant
      @venues = VenueRanking.select("place_name, sum(note) as note").where(event: @event.id).where(user: current_user).group("place_name")
      #on prend le dernier pour récupérer la best note
      @max_note = @venues.sort_by { |venue| venue.note}.last
      #Il faut update la venue de l'event
      @event.venue = @max_note.place_name
      @event.save!
    else
      raise
    end
  end
end
