class SyncDollarRate < ApplicationService
  attr_reader :sbr_response, :currency, :rate

  def initialize
    @sbr_response = Cbr::Response.new(Cbr::Request.call)
  end

  def call
    set_currency
    return rate_update if rate_exist?
    rate_create
  end

  private

  def set_currency
    @currency = Currency.find_by(name: 'USD')
  end

  def rate_exist?
    @rate = currency
      .rates
      .where(date_at: sbr_response.date)
      .where(forced: false)
      .last

    rate.present?
  end

  def rate_update
    rate.update(value: sbr_response.valute[:usd]['Value'])

    broadcast
  end

  def rate_create
    @rate = Rate.create(
      currency_id: currency.id,
      date_at: sbr_response.date,
      value: sbr_response.valute[:usd]['Value'],
      expires_at: Time.zone.now
    )

    broadcast
  end

  def broadcast
    ActionCable.server.broadcast 'rate_update_channel', rate_value: rate.value.round(2)
  end
end
