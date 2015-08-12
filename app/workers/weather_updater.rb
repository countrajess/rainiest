class WeatherUpdater
  include Sidekiq::Worker

  def perform
    Location.update_all_forecasts
  end
end
