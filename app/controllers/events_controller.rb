class EventsController < ApplicationController
  # before_action :set_event

  def index
    # @events = Event.all
    @events = policy_scope(current_user.events)
  end

  def new

  end

  def show
    @event = Event.find(params[:id])
    authorize @event
    @userevents = UserEvent.where("event_id = ?", params[:id])
    # raise
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
