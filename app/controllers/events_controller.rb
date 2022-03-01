class EventsController < ApplicationController
  # before_action :set_event

  def index
    # @events = Event.all
    @events = policy_scope(Event)
  end

  def create
    authorize @event
  end
end
