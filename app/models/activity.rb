class Activity
  include Mongoid::Document
  include Mongoid::Paperclip
  field :note, type: String

  belongs_to :user

  has_mongoid_attached_file :photo
  validates_attachment :photo, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
