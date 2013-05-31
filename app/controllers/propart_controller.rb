class PropartController < ApplicationController

  def index
    @joinings = Duty.all
  end

end
