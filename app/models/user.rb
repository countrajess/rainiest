class User < ActiveRecord::Base
  belongs_to :location

  def self.send_sms
    hour = Time.zone.now.hour

    where(text_time: "#{hours}:00").find_each do |u|
      u.send_weather_for_location
    end
  end

  def send_weather_for_location
    client = Twilio::REST::Client.new ENV["TWILIO_ACCOUNT"], ENV["TWILIO_AUTH"]

  end

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
