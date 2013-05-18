class Comment < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }

  attr_accessible :commentable_id, :commentable_type, :content

  belongs_to :commentable, :polymorphic => true
end
