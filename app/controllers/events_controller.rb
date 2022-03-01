class EventsController < ApplicationController
  # before_action :set_event

  def index
    # @events = Event.all
    @events = policy_scope(current_user.events)
  end

  def create
    authorize @event
  end
end
