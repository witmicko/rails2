class StrengthActivity < Activity
  include Mongoid::Document
  field :type, type: String
  field :weight, type: Integer
  field :sets, type: Integer
  field :reps, type: Integer
end
