class GetRestaurants
  def initialize(user, event)
    @user = user
    @event = event
  end

  def call
    url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{@user.latitude},#{@user.longitude}&radius=200&type=restaurant&key=#{ENV['GOOGLE_TOKEN']}"
    user_serialized = URI.open(url).read
    @response = JSON.parse(user_serialized)
    @response["results"].each do |result|
      if result["rating"].class != NilClass && result["rating"] > 2 && result["name"] != "Franprix"
        if Venue.all.where(name: result["name"]).count < 1
          @venue = Venue.new
          @venue.name = result["name"]
          @venue.address = result["vicinity"]
          @venue.save!
        end
      end
    end
  end
end
