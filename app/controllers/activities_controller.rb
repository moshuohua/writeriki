class ActivitiesController < ApplicationController
  def index
    @users = User.all
    @activities = PublicActivity::Activity.order("created_at desc")
  end
end
