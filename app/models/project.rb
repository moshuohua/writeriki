class Project < ActiveRecord::Base
  attr_accessible :description, :end_at, :name, :start_at
  has_many :users
  has_many :user_projectships, :dependent => :destroy
end
