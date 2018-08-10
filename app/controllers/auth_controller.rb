class AuthController < ApplicationController
  before_action :authenticate_user, only: :destroy

  def new
    return redirect_to root_path if current_user
    @user = User.new
    @no_container = true
  end

  def google_oauth2
    user = User.from_google_oauth2(auth_params)
    email = user.info['email']
    respond_to do |format|
      if set_session_user(user)
        format.html { redirect_to root_path, notice: "Logged in with #{email} successfully." }
        format.json { render :show, status: :created, location: root_path }
      else
        format.html { redirect_to new_auth_path, notice: 'Please try again.' }
        format.json { head :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if clear_session_user
        format.html { redirect_to root_path, notice: 'Logged out successfully.' }
        format.json { render :show, status: :created, location: root_path }
      else
        format.html { redirect_to root_path, notice: 'Please try again.' }
        format.json { head :unprocessable_entity }
      end
    end
  end

  private

  def auth_params
    {
      google_uid: request.env['omniauth.auth']['uid'],
      info: request.env['omniauth.auth']['info']
    }
  end

  def set_session_user(user)
    return false unless user.class == User
    session[:user] = user
  end

  def clear_session_user
    session.delete(:user)
  end
end
