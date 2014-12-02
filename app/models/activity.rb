class Activity
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  field :note, type: String

  embedded_in :user

  has_mongoid_attached_file :photo
  validates_attachment :photo, content_type: { content_type: ['image/jpg', 'image/jpeg','image/png', 'image/gif'] }
end
