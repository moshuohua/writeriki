class Task < ActiveRecord::Base
  include PublicActivity::Model
  tracked :owner => Proc.new{ |controller, model| controller.current_user }
  
  attr_accessible :event_id, :user_id

  belongs_to :user
  belongs_to :event
end
