class FitnessActivity < Activity
  include Mongoid::Document
  field :act_type, type: String
  field :distance, type: Float
  field :heart_rate, type: Integer
  field :calories, type: Integer
  field :duration, type: Float

  TYPES = ['Running', 'Cycling','Walking','Other']
  validates :act_type, inclusion: TYPES

end
