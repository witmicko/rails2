class FitnessActivity < Activity
  include Mongoid::Document
  field :type, type: String
  field :distance, type: Float
  field :heart_rate, type: Integer
  field :calories, type: Integer
  field :duration, type: Float
end
