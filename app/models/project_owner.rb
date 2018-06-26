class ProjectOwner
  include Mongoid::Document
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :phone, type: String

  embedded_in :project

  def full_name
    [first_name, last_name].join(' ')
  end
end
