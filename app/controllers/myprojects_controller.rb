class MyprojectsController < ApplicationController

  def index
    @projects = Project.where("user_id = ?", current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

end
