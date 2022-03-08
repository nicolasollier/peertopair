class EventChannel < ApplicationCable::Channel
  def subscribed
    event_stream = User.find(params[:id])
    stream_for event_stream
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
