class SessionsController < ApplicationController
  def create
    @user = User.from_omniauth(auth_hash)
    session[:user_id] = @user.id
    session[:access_token] = auth_hash_credentials.token
    session[:access_token_secret] = auth_hash_credentials.secret
    flash[:success] = "Welcome, #{@user.name}!"
    redirect_to root_path
  end

  def destroy
    if current_user
      session.delete(:user_id)
      flash[:success] = "See you later!"
    end
    redirect_to root_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

  def auth_hash_credentials
    auth_hash.credentials
  end
end
