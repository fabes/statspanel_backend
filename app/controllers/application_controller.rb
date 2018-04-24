class ApplicationController < ActionController::API
  include ActionController::Helpers
  helper_method :valid_token?, :active_user

  private
  def valid_token? 
    return true if active_user
    return false
  end

  def auth_request 
    head(:unauthorized) if !valid_token?
  end

  def active_user 
    auth_token = request.headers['HTTP_AUTH_TOKEN']
    User.find_by(authentication_token: auth_token)
  end
end
