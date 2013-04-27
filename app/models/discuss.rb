class Discuss < ActiveRecord::Base
  attr_accessible :content, :title

  belongs_to :project
  belongs_to :user

end
