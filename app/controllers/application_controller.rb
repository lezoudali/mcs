class ApplicationController < ActionController::API
  include ActionController::RespondWith
 
  respond_to :json
end
