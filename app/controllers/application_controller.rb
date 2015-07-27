class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  def current_user
    @current_user ||= session[:user_id] && User.find(session[:user_id])
  end

  private

  helper_method :signed_in?
  def signed_in?
    !current_user.nil?
  end

  def authorize
    unless signed_in?
      session[:return_to] = request.original_url
      redirect_to '/auth/twitter', alert: 'You must login to access this page.'
    end
  end
end
