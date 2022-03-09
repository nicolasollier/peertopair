class UserEventsController < ApplicationController
  def create
    @userevent = UserEvent.new
    @event = Event.find(params[:event_id])
    authorize @event
    @userevent.user = current_user
    @userevent.event = @event
    authorize @userevent

    if @userevent.save!
      raise
      EventChannel.broadcast_to(
        @event.other_user(current_user),
        render_to_string(partial: "events/pairing_alert", locals: { event: @event })
      )
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def update
    userevent = UserEvent.where(user: current_user).where(event: params[:event_id])
    userevent.update(ranking_done: true)
  end
end
