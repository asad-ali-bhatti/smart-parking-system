App.sensors = App.cable.subscriptions.create "SensorsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log 'connection created!'
  disconnected: ->
    # Called when the subscription has been terminated by the server
    console.log 'connection lost'
  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    console.log 'data recieved'
    console.log data
    location.reload()
