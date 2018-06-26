class Project
  include Mongoid::Document
  field :name, type: String
  field :street, type: String
  field :city, type: String
  field :zip, type: String
  field :state, type: String
  field :country, type: String
  field :coordinates, type: Array

  has_many :sensors
  embeds_one :project_owner
end
