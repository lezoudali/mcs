class ApplicationController < ActionController::API
  include ActionController::RespondWith
  include ActionController::Serialization

  include Authenticable
  respond_to :json

  after_action :cors_set_access_control_header

  def cors_set_access_control_header
    headers['Access-Control-Allow-Origin'] = '*'
  end
end
