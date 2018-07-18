class RateUpdateChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'rate_update_channel'
  end

  def update_value
    ActionCable.server.broadcast 'rate_update_channel', rate_value: rate&.value&.round(2)
  end

  private

  def rate
    Rate.not_expired.last || Rate.real.last
  end
end
