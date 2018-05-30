class Sensor
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :status, type: Integer
end