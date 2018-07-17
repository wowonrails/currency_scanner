class RatesController < ApplicationController
  expose(:rate) { Rate.not_expired.last || Rate.real.last }

  def show
  end
end
