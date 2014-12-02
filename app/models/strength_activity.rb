class StrengthActivity < Activity
  include Mongoid::Document
  field :act_type, type: String
  field :weight, type: Integer
  field :sets, type: Integer
  field :reps, type: Integer

  TYPES = ['Bench press', 'Squats','Deadlift','Overhead Press']
  validates :act_type, inclusion: TYPES
end
