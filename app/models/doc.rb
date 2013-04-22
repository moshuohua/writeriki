class Doc < ActiveRecord::Base
  attr_accessible :content, :keyword, :title, :user_id

  belongs_to :user
  belongs_to :project
end
