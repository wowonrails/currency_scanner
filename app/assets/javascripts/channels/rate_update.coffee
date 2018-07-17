App.rate_update = App.cable.subscriptions.create "RateUpdateChannel",
  connected: ->
    @update_value()

  received: (data) ->
    $('#rate-container').text(" ₽ #{data['rate_value']}")

  update_value: ->
    @perform 'update_value'
