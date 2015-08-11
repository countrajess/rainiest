class Location < ActiveRecord::Base
  has_many :users

  def self.update_all_forecasts
    all.map(&:update_forecast)
  end

  def update_forecast
    api = Wunderground.new
    response = api.forecast_for(self.to_s)

    update_attributes(
      pop: response["forecast"]["simpleforecast"]["forecastday"][0]["pop"],
      icon: response["forecast"]["simpleforecast"]["forecastday"][0]["icon"],
      low: response["forecast"]["simpleforecast"]["forecastday"][0]["low"]["celsius"],
      high: response["forecast"]["simpleforecast"]["forecastday"][0]["high"]["celsius"],
    )
  end

  def to_s
    "#{country}/#{city}"
  end
end
