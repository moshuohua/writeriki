class Attachment < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }

  mount_uploader :attachment, AttachmentUploader

  attr_accessible :attachment, :description, :name
  validates_presence_of :attachment
end
