class TaskController < ApplicationController

  def index
    @tasks = Task.all
  end

  respond_to do |format|
    format.html # index.html.erb
    format.json { render json: @tasks }
  end

end
