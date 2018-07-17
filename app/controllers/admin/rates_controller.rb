class Admin::RatesController < Admin::BaseController
  expose :rate, build_params: :custom_rate_params

  def new
    authorize(current_admin)
    self.rate = Rate.new(Rate.not_expired.last&.attributes)
  end

  def create
    return redirect_to root_path if rate.save
    render :new
  end

  private

  def rate_params
    params.require(:rate).permit(:value, :expires_at)
  end

  def custom_rate_params
    rate_params.merge(
      currency_id: Currency.find_by(name: 'USD').id,
      date_at: Time.zone.today,
      forced: true
    )
  end
end
