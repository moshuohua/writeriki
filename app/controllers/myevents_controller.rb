class MyeventsController < ApplicationController
  before_filter :authenticate_user!

  #events created by yourself
  def index
    @events = current_user.events
  end
end
