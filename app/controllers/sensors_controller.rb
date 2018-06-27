class SensorsController < ApplicationController

  def index
    @sensors = Sensor.all
    render json: @sensors
  end

  def show
    @sensor  = Sensor.find(params[:id])
    render json: @sensor
  end

  def update
    @sensor  = Sensor.find(params[:id]).update(sensor_params)
    render json: @sensor
  end

  def create
    @sensor = Sensor.create(sensor_params)
    render json: @sensor
  end

  private

  def sensor_params
    params.expect(:sensor).permit(:name, :status, :description, :is_available)
  end
end
