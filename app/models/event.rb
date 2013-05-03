class Event < ActiveRecord::Base
  attr_accessible :end_at, :name, :start_at, :content, :level, :appointment, :user_id, :project_id
  has_event_calendar

  belongs_to :project

  has_many :users, :through => :tasks
  has_many :tasks, :dependent => :delete_all
  
  has_many :comments, :as => :commentable
end
