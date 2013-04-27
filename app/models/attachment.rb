class Attachment < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader

  attr_accessible :attachment, :description, :name
  validates_presence_of :attachment
end
