class UserEventsController < ApplicationController
  def edit
    @user_event = User_event.all
    raise
  end
end
