class Project < ActiveRecord::Base
  attr_accessible :description, :end_at, :name, :start_at
  has_many :users, :through => :duties
  has_many :duties, :dependent => :delete_all

  has_many :docs
  has_many :events
end
