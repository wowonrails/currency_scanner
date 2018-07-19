App.rate_update = App.cable.subscriptions.create "RateUpdateChannel",
  connected: ->
    @perform 'update_value'

  received: (data) ->
    currencyFormatter = new CurrencyFormatter
    formattedRateValue = currencyFormatter.format(data['rate_value'])

    $('[data-rate-container]').text(formattedRateValue)
