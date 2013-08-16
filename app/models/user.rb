class User
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  field :uid, type: String
  field :provider, type: String

  # def self.create_with_omniauth(auth)
  #   create! do |user|
  #     user.provider = auth["provider"]
  #     user.uid = auth["uid"]
  #     user.name = auth["info"]["name"]
  #   end
  # end
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

end