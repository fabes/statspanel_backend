class ApplicationController < ActionController::API
  include ActionController::Helpers
  helper_method :valid_token?

  private
  def valid_token? 
    auth_token = request.headers['HTTP_AUTH_TOKEN']
    return true if User.find_by(authentication_token: auth_token)
    return false
  end
end
