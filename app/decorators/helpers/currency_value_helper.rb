module Helpers::CurrencyValueHelper
  def value
    h.number_to_currency(object.value, locale: :ru)
  end
end
