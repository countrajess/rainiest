class SmsSender
  include Sidekiq::Worker
  def perform
    User.send_sms
  end
end
