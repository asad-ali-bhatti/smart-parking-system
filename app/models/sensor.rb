class Sensor
  include Mongoid::Document

  field :name, type: String
  field :description, type: String
  field :status, type: Integer
  field :is_available, type: Boolean, default: true
  field :location, type: Array
  field :information, type: String

  belongs_to :sensor_type
  belongs_to :project
  has_many :violations

  def latitude
    location[0] if location
  end

  def longitude
    location[1] if location
  end

  def available?
    is_available
  end

  def sensor_image
    available? ? 'parking_available.png' :  'parking_not_available.png'
  end

  def update_marker
    p name
  end

  def toggle_availability
    update is_available: !is_available
    notify_clients
  end

  def notify_clients
    p 'Sending message to google maps client'
    ActionCable.server.broadcast 'sensors_channel', message: 'What ever'
  end

  class << self
    def markers(sensors)
      Gmaps4rails.build_markers sensors do |sensor, marker|
        marker.lat sensor.latitude
        marker.lng sensor.longitude
        marker.picture({ url: ActionController::Base.helpers.image_url(sensor.sensor_image), width: 32, height: 37})
        marker.infowindow sensor.information
        marker.json({id: sensor.name})
      end
    end
  end
end
