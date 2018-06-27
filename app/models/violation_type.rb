class ViolationType
  include Mongoid::Document
  field :name, type: String

  has_many :violations
end
