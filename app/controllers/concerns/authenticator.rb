module Authenticator
  extend ActiveSupport::Concern

  def authenticate_user
    return true if user
    redirect_to new_auth_path
  end

  def current_user
    user
  end

  private

  def user
    User.find_by(google_uid: session_user['google_uid'])
  end

  def session_user
    session[:user] || {}
  end
end