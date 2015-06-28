class ApplicationController < ActionController::API
  include ActionController::RespondWith
  include ActionController::MimeResponds


  include Authenticable
  respond_to :json
end
