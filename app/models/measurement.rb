class Measurement < Activity
  include Mongoid::Document
  field :weight, type: Double
  field :fat, type: Double

  validates :weight, presence: true
  validates :fat, presence: true
end
