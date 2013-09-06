class Photo
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  mount_uploader :image, PhotoUploader
  
  belongs_to :user
  belongs_to :place
  belongs_to :location
  
  validates_presence_of :image
  validates_presence_of :user
  
  before_save :set_location
  
  private
  
  def set_location
    exif_obj = EXIFR::JPEG.new(self.image.file.path)
    return unless exif_obj.gps
    
    coordinates = [exif_obj.gps.longitude, exif_obj.gps.latitude]
    unless location = Location.where(coordinates: coordinates).first
      location = Location.create(coordinates: coordinates, user_id: self.user_id)
    end
    self.location = location
  end
end
