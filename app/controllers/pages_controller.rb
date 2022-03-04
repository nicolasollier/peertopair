class PagesController < ApplicationController
  require "open-uri"
  require "net/http"
  require 'json'

  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @event = Event.new


  end

  private

end
