class UserEventsController < ApplicationController
  def create
    @userevent = UserEvent.new
    @event = Event.find(params[:event_id])
    authorize @event
    @userevent.user = current_user
    @userevent.event = @event
    authorize @userevent

    if @userevent.save!
      redirect_to event_path(@event)
    else
      render :new
    end
  end
end
