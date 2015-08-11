class User < ActiveRecord::Base
  belongs_to :location

  def self.find_or_create_from_auth_hash(auth_hash)
    user = where(provider: auth_hash["provider"], uid: auth_hash["uid"]).first
    if user.nil?
    user = create(provider: auth_hash["provider"],
            uid: auth_hash["uid"],
            name: auth_hash["info"]["name"],
            email: auth_hash["info"]["email"],
            image: auth_hash["info"]["image"])
    end
    user
  end
end
