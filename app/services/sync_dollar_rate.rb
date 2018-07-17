class SyncDollarRate < ApplicationService
  attr_reader :sbr_response, :currency, :last_rate

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
    @last_rate = currency
      .rates
      .where(date_at: sbr_response.date)
      .where(forced: false)
      .last

    last_rate.present?
  end

  def rate_update
    last_rate.update_column(:value, sbr_response.valute[:usd]['Value'])
  end

  def rate_create
    Rate.create(
      currency_id: currency.id,
      date_at: sbr_response.date,
      value: sbr_response.valute[:usd]['Value'],
      expires_at: Time.zone.now
    )
  end
end
