class User < ActiveRecord::Base
  belongs_to :location

  def self.send_sms
    hour = Time.zone.now.hour

    where(text_time: "#{hour}:00").find_each do |u|
      u.send_weather_for_location
    end
  end

  def send_weather_for_location
    client = Twilio::REST::Client.new ENV["TWILIO_ACCOUNT"], ENV["TWILIO_AUTH"]

    client.account.messages.create(
      :from => "+441172001515",
      :to => phone_no,
      :body => message_for_pop(pop)
    )
  end

  def message_for_pop(pop)
    if location.pop.to_i = '10..39'
      "It might rain today. The probability of precipitation is between 10-39"
    elsif location.pop.to_i = '40..59'
      "It probably will rain today. The probability of precipitation is between 40-59"
    elsif location.pop.to_i = '60..100'
      "It most likely will rain today. The probability of precipitation is between 60-100"
    end
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
