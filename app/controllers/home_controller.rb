class HomeController < ApplicationController
  def index
    @sensors = Sensor.all
    @markers = Sensor.markers(@sensors)
  end
end
