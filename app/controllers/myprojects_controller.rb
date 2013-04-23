class MyprojectsController < ApplicationController

  def index
    @user = current_user
    @joinings = Duty.all
    @pros = Project.all
    @projects = Project.where("user_id = ?", @user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
      format.json { render json: @joinings }
    end
  end

end
