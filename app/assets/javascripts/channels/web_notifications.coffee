App.web_notifications = App.cable.subscriptions.create 'WebNotificationsChannel',
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#rate-container').text(" ₽ #{data['rate_value']}")

  send_rate: () ->
    @perform 'send_rate'


$(document).ready ->
  refreshId = setInterval((->
    App.web_notifications.send_rate()
    return
  ), 1000)
  return
