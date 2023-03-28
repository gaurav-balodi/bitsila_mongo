class Location
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  field :address, type: String
  field :city, type: String
  field :state, type: String

  belongs_to :restaurant, optional: true
end
