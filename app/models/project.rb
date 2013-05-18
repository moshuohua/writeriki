class Project < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }

  attr_accessible :description, :end_at, :name, :start_at
  has_many :users, :through => :duties
  has_many :duties, :dependent => :delete_all

  has_many :docs
  has_many :events
  has_many :discusses
  has_many :files
end
