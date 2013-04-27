class Doc < ActiveRecord::Base
  attr_accessible :content, :keyword, :title, :user_id, :project_id

  belongs_to :user
  belongs_to :project
  has_many :comments, :as => :commentable
end
