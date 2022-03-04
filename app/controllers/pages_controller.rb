class PagesController < ApplicationController
  require "open-uri"
  require "net/http"
  require 'json'

  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @event = Event.new
    @userevent = UserEvent.where(user: current_user).where(event: params[:event_id])
    @response = GetRestaurants.new(current_user, current_user.events.last).call

  end

  private

end
