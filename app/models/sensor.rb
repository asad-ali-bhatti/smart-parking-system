class Sensor
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :status, type: Integer
  field :is_available, type: Boolean, default: false

  belongs_to :sensor_type
  belongs_to :project
  has_many :violations
end
