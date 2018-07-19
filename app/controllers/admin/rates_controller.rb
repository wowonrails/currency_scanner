class Admin::RatesController < Admin::BaseController
  expose :currency, -> { Currency.default }
  expose :rate, scope: -> { currency.rates }

  def new
    self.rate = Rate.build_from(Rate.forced.last)
  end

  def create
    rate.assign_attributes(date_at: Time.zone.today, forced: true)
    rate.save

    respond_with rate, location: root_path
  end

  private

  def rate_params
    params.require(:rate).permit(:value, :expires_at)
  end
end
