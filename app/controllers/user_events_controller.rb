class UserEventsController < ApplicationController

  def create
    @userevent = UserEvent.new
    @event = Event.find(params[:event_id])
    @userevent.user = current_user
    @userevent.event = @event
    authorize @userevent
    if @userevent.save!
      redirect_to dashboard_path
    else
      render :new
    end
  end

end
