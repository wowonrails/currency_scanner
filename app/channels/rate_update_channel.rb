class RateUpdateChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'rate_update_channel'
  end

  def update_value
    ActionCable.server.broadcast 'rate_update_channel', rate_value: rate.value
  end

  private

  def rate
    PublicRatesQuery.last || NullRate.new
  end
end
