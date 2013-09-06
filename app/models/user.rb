class User
  include Mongoid::Document
  include Mongoid::Timestamps

  PROVIDERS = %w(facebook twitter)

  field :name
  field :email
  field :uid
  field :provider

  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :uid
  validates_presence_of :provider
  validates_inclusion_of :provider, in: PROVIDERS
  validates_uniqueness_of :uid, scope: :provider

  has_and_belongs_to_many :places
  has_many :photos

  def locations
    @locations ||= Location.in(id: photos.map(&:location_id))
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
      end
    end
  end

  def format_globe_data
    result = {}
    (2010..Time.now.year).each do |year|
      tmp_array = []
      
      locations.each do |location|
        tmp_array += location.coordinates
        magnitude = location.photos.where(:created_at => (Time.parse("#{year}-01-01 00:00:00")..Time.parse("#{year}-12-31 23:59:59"))).count.to_f / 10
        tmp_array << magnitude
      end

      result[year.to_s] = tmp_array
    end
    result
  end
end
