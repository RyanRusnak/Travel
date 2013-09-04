class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :email, type: String
  field :uid, type: String
  field :provider, type: String

  has_many :locations
  has_many :photos

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
        magnitude = photos.where(:created_at => (Time.parse("2013-01-01 00:00:00")..Time.parse("2013-12-31 23:59:59"))).count / 10
        tmp_array << magnitude
      end

      result[year.to_s] = tmp_array
    end
  end
end
