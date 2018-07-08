Thread.new do
  client = MQTT::Client.connect(host: 'eu.thethings.network', port: 1883,
                                username: ENV["TTN_APP_USERNAME"], password: ENV["TTN_APP_PASSWORD"])
  if client.connected?
    p "#...Connection to TTN established...#"
    client.subscribe("#{ENV["TTN_APP_USERNAME"]}/devices/parking_sensor/up")

    client.get do |topic, message|
      message = JSON.parse message
      p "####### MESSAGE FROM THE THINGS NETWORK "
      updated_sensors = []

      message['payload_fields'].each do |sensor_name, status|
        sensor = Sensor.find_by(name: sensor_name)
        if sensor.present? && sensor.is_available != status
          updated_sensors << sensor
        end
      end
      updated_sensors.each &:toggle_availability
      p "Parking available: #{ message['payload_fields']['parking_1']}"
      p "Sensor ID: #{ message['payload_fields']['sensor'] }"
    end
  else
    p "#...Connection to TTN Failed!...#"
  end
end