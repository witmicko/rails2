class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword

  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :gender, type: String
  field :athlete_type, type: String
  field :date_of_birth, type: Date
  field :password_digest, type: String
  field :remember_token, type: String
  has_secure_password

  embeds_many :activities, cascade_callbacks: true

  validates :password, presence: true, length: {minimum: 6}
  validates :password_confirmation, presence: true

  validates :first_name, :last_name, presence: true, length: {in: 2..30}

  GENDERS = ['Male', 'Female']
  validates :gender, inclusion: GENDERS

  ATHLETE_TYPES = ['Runner', 'Cyclist', 'Powerlifter']
  validates :athlete_type, inclusion: ATHLETE_TYPES
  validates_date :date_of_birth

  validates :email, presence: true, :email_format => {:message => 'invalid email'}
  validates :email, presence: true, uniqueness: {message: 'duplicate email'}

  index({email: 1}, {unique: true})
  index({remember_token: 1})

  before_save do |user|
    user.email = email.downcase
    user.remember_token = SecureRandom.urlsafe_base64
  end
end
