class Location
  include Mongoid::Document
  include Mongoid::Timestamps
  include Geocoder::Model::Mongoid

  field :address
  field :city
  field :state
  field :zipcode
  field :country
  field :coordinates, type: Array

  has_many :photos
  
  validates_presence_of :coordinates
  validates_uniqueness_of :coordinates

  reverse_geocoded_by :coordinates do |obj, results|
    if geo = results.first
      obj.address = geo.address
      obj.city    = geo.city
      obj.state   = geo.state
      obj.zipcode = geo.postal_code
      obj.country = geo.country
    end
  end

  after_validation :reverse_geocode

end
