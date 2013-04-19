class MydocsController < ApplicationController
  before_filter :authenticate_user!

  #docs by current user
  def index
    @docs = current_user.docs
  end
end
