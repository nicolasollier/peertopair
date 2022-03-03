class PagesController < ApplicationController
  require "open-uri"
  require "net/http"
  require 'json'

  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @current_user_events = policy_scope(current_user.events)
    @event = Event.find(params[:id])
    @userevents = UserEvent.where("event_id = ?", params[:id])
    @userevent_current = UserEvent.where(user: current_user).where(event: params[:id])
  end

end
