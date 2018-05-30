Thread.new do
  client = MQTT::Client.connect(host: 'eu.thethings.network', port: 1883,
                                username: ENV["TTN_APP_USERNAME"], password: ENV["TTN_APP_PASSWORD"])
  if client.connected?
    p "#...Connection to TTN established...#"
    client.subscribe("#{ENV["TTN_APP_USERNAME"]}/devices/12345/up")

    client.get do |topic, message|
      message = JSON.parse message
      p "####### MESSAGE FROM THE THINGS NETWORK "
      p "Parking available: #{ message['payload_fields']['available']}"
      p "Sensor ID: #{ message['payload_fields']['sensor'] }"
    end
  else
    p "#...Connection to TTN Failed!...#"
  end
end