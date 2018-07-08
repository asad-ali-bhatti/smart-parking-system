class SensorsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "sensors_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
