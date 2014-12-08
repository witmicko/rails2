class Measurement < Activity
  include Mongoid::Document
  field :weight, type: Float
  field :fat, type: Float

  validates :weight, presence: true
  validates :fat, presence: true, :numericality => {:greater_than => 0, :less_than => 100}
end
