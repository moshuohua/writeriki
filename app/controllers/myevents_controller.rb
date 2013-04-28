class MyeventsController < ApplicationController
  before_filter :authenticate_user!

  #events created by yourself
  def index
    @events = Event.where( "user_id = ?", current_user.id )
  end
end
