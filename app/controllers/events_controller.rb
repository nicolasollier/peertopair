class EventsController < ApplicationController
  # before_action :set_event
  require "open-uri"
  require "net/http"
  require 'json'
  require 'pry-byebug'

  def index
    @events = Event.all
    @current_user_events = policy_scope(current_user.events)
    @event = Event.new



  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
    @events = Event.all
    @userevents = UserEvent.where("event_id = ?", params[:id])
    @userevent_current = UserEvent.where(user: current_user).where(event: params[:id])
    @markers = []
    @markers.push(
      {
        lat: @event.latitude,
        lng: @event.longitude,
        # info_window: render_to_string(partial: "info_window", locals: { event: event })
      })


  end

  def create
    @event = Event.new(event_params)
    authorize @event

    if @event.save
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

  def cancel
    @event = Event.find(params[:id])
    @event.canceled = true
    @event.save
    redirect_to dashboard_path
  end

  private

  def event_params
    params.require(:event).permit(:start_date, :end_date, :format, :event_type)
  end
end
