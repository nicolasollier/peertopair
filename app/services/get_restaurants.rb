class GetRestaurants
  def initialize(user, event)
    @user = user
    @event = event
  end

  def call
    return unless @event.event_type

    url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{@user.latitude},#{@user.longitude}&radius=200&type=restaurant&key=#{ENV['GOOGLE_TOKEN']}"
    user_serialized = URI.open(url).read
    @response = JSON.parse(user_serialized)
  end
end
