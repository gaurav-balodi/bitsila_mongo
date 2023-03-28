class Category
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  field :name, type: String

  belongs_to :restaurant, optional: true
end
