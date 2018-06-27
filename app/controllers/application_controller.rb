class ApplicationController < ActionController::API
  before_action :render_json

  def render_json
    request.format = :json
  end
end
