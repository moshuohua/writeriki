class Doc < ActiveRecord::Base
  include PublicActivity::Model
  tracked :owner => Proc.new{ |controller, model| controller.current_user }

  attr_accessible :content, :keyword, :title, :user_id, :project_id

  belongs_to :user
  belongs_to :project
  has_many :comments, :as => :commentable
end
