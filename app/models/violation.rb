class Violation
  include Mongoid::Document
  field :description, type: String

  belongs_to :violation_type
  belongs_to :sensor
end
