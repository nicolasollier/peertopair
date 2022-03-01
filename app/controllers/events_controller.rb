class EventsController < ApplicationController
  def index
    # @events = Event.all
    @events = policy_scope(Event)
  end

  def create
    authorize @event
  end
end
