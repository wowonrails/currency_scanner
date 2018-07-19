class UsdRateSynchronizer
  def initialize
    @request  = Cbr::Request.new
    @currency = Currency.find_by(name: 'USD')
  end

  def call
    @sbr_response = Cbr::Response.new(@request.call)

    return rate_update_and_broadcast if rate.present?
    rate_create_and_broadcast
  end

  private

  def rate
    @rate ||= begin
      @currency
        .rates
        .where(date_at: @sbr_response.date)
        .non_forced
        .last
    end
  end

  def rate_update_and_broadcast
    rate.update(value: @sbr_response.valute[:usd]['Value'])

    broadcast
  end

  def rate_create_and_broadcast
    @rate = Rate.create(
      currency_id: @currency.id,
      date_at: @sbr_response.date,
      value: @sbr_response.valute[:usd]['Value'],
      expires_at: Time.zone.now
    )

    broadcast
  end

  def broadcast
    ActionCable.server.broadcast 'rate_update_channel', rate_value: rate.value.round(2)
  end
end
