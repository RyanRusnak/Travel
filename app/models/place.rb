class Place
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name

  validates_presence_of :name
  
  has_and_belongs_to_many :users
  has_many :photos
end
