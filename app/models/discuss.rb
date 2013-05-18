class Discuss < ActiveRecord::Base
  include PublicActivity::Model
  tracked :owner => Proc.new{ |controller, model| controller.current_user }

  attr_accessible :content, :title

  belongs_to :project
  belongs_to :user

end
