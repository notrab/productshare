class AuthCallbacksController < ApplicationController
  def create
    session[:return_to] = params[:return_to]
    @user = AuthMicroService.new(auth_hash).find_or_create

    session[:user_id] = @user.id
    redirect_to auth_origin, notice: "Welcome #{@user.name}!"
  end

  def failure
    redirect_to root_url, alert: "Something went wrong: #{params[:message].humanize}"
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

  def auth_origin
    session[:return_to] || request.env['omniauth.origin'] || root_url
  end
end
