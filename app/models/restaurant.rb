class Restaurant
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Enum
  include Mongoid::Attributes::Dynamic

  enum :source, [:zomato, :swiggy, :magic_pin]
  field :name, type: String
  field :url, type: String
  field :phone_number, type: String

  has_many :locations, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :products, dependent: :destroy
end

