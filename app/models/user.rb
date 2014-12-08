class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword
  include Mongoid::Paperclip

  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :gender, type: String
  field :athlete_type, type: String
  field :date_of_birth, type: Date
  field :password_digest, type: String
  field :remember_token, type: String
  has_secure_password

  has_mongoid_attached_file :photo,
                            :styles => {
                                :thumb => "100x100#",
                                :small  => "150x150>",
                                :medium => "200x200" },
      :default_url => "silhouette.jpg"

  validates_attachment :photo, content_type: { content_type: ['image/jpg', 'image/jpeg','image/png', 'image/gif'] }

  has_many :activities, dependent: :destroy
  has_and_belongs_to_many :following, class_name: 'User', inverse_of: :followers, autosave: true
  has_and_belongs_to_many :followers, class_name: 'User', inverse_of: :following



  validates :password, presence: true, length: {minimum: 6}
  validates :password_confirmation, presence: true

  validates :first_name, :last_name, presence: true, length: {in: 2..30}

  GENDERS = ['Male', 'Female']
  validates :gender, inclusion: GENDERS

  ATHLETE_TYPES = ['Runner', 'Cyclist', 'Powerlifter']
  validates :athlete_type, inclusion: ATHLETE_TYPES

  # turned off for dev stage
  # validates_date :date_of_birth
  # validates :email, presence: true, :email_format => {:message => 'invalid email'}

  validates :email, presence: true, uniqueness: {message: 'duplicate email'}

  index({email: 1}, {unique: true})
  index({remember_token: 1})

  before_save do |user|
    user.email = email.downcase
    user.remember_token = SecureRandom.urlsafe_base64
  end

  def follow!(other_user)
    if self.id != other_user.id && !self.following.include?(other_user)
      self.following << other_user
      true
    else
      false
    end
  end

  def unfollow!(other_user)
    if self.following.delete(other_user)
      true
    else
      false
    end
  end
end
