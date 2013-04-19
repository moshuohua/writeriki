class Project < ActiveRecord::Base
  attr_accessible :description, :end_at, :name, :start_at
end
