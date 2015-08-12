require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = { :size => 1 }
end

Sidekiq.configure_server do |config|
  config.redis = { :size => 2 }

  schedule_file = "config/schedule.yml"

  if File.exists?(schedule_file)
    Rails.logger.info "Loading #{schedule_file}"
    Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
  else
    Rails.logger.fatal "Could not find file #{schedule_file}"
  end
end
