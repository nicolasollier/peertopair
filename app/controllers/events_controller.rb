class EventsController < ApplicationController
  # before_action :set_event

  def index
    # @events = Event.all
    @events = policy_scope(current_user.events)
  end

  def new

  end

  def create
    @event = Event.new(event_params)
    @event.status = "Pending"
    authorize @event
    if @event.save!
      @userevent = UserEvent.new
      @userevent.user = current_user
      @userevent.event = @event
      if @userevent.save!
        redirect_to dashboard_path
      else
        render :new
      end
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:start_date, :end_date, :format, :event_type)
  end

end
