class EventsController < ApplicationController
  # before_action :set_event

  def index
    @events = Event.all
  end

  def create
    authorize @event
  end
end
