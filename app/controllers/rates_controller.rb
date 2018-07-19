class RatesController < ApplicationController
  expose(:rate) { PublicRatesQuery.last || NullRate.new }

  def show
  end
end
