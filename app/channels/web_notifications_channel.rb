class WebNotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'web_notifications_channel'
  end

  def unsubscribed
  end

  def send_rate
    ActionCable.server.broadcast 'web_notifications_channel', rate_value: rate&.value.round(2)
  end

  private

  def rate
    Rate.not_expired.last || Rate.real.last
  end
end
