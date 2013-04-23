class MyprojectsController < ApplicationController

  def index
    @user = current_user
    @joinings = Project.where("user_id = ?", Duty.find_all_by_user_id(@user.id))
    @projects = Project.where("user_id = ?", @user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

end
