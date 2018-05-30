class Project
  include Mongoid::Document
  field :name, type: String
  field :city, type: String
  field :zip_code, type: String
  field :state, type: String
  field :country, type: String
end
