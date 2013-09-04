class Photo
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  
  belongs_to :user
  belongs_to :location
end
