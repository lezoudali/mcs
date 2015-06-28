class ApplicationController < ActionController::API
  include ActionController::RespondWith


  include Authenticable
  respond_to :json
end
