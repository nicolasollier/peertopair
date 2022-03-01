class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def create
    authorize @event
  end
end
