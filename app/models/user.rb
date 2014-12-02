class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :gender, type: String
  field :athlete_type, type: String
  field :date_of_birth, type: Date
  field :password_digest
  has_secure_password

  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true


  validates :first_name, :last_name,presence:true, length: { in: 2..30 }

  GENDERS = ['Male', 'Female']
  validates :gender, inclusion: GENDERS

  ATHLETE_TYPES = ['Runner', 'Cyclist', 'Powerlifter']
  validates :athlete_type, inclusion: ATHLETE_TYPES
  validates_date :date_of_birth

  validates :email, presence:true, :email_format => { :message => 'invalid email' }
  validates :email, presence:true, uniqueness: {message: 'duplicate email'}

  # index({u_id:1}, { unique: true, name: 'u_id_index'})

  before_save { |user| user.email = email.downcase }
end
