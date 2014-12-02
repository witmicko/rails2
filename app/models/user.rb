class User
  include Mongoid::Document

  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :gender, type: String
  field :athlete_type, type: String
  field :date_of_birth, type: Date
  field :u_id

  GENDERS = ['Male', 'Female']
  validates :gender, inclusion: GENDERS
  ATHLETE_TYPES = ['Runner', 'Cyclist', 'Powerlifter']
  validates :athlete_type, inclusion: ATHLETE_TYPES
  validates_date :date_of_birth

  validates :email, :email_format => { :message => 'invalid email' }
  validates :email, uniqueness: {message: 'duplicate email'}

  index({u_id:1}, { unique: true, name: 'u_id_index'})
end
