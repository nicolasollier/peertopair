class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @current_user_events = policy_scope(current_user.events)
  end
end
