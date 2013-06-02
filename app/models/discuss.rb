class Discuss < ActiveRecord::Base
  include PublicActivity::Model
  tracked :owner => Proc.new{ |controller, model| controller.current_user }

  attr_accessible :content, :title, :project_id

  belongs_to :project
  belongs_to :user

  has_many :comments, :as => :commentable
end
