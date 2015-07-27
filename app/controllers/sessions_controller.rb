class SessionsController < ApplicationController
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'You have successfully signed out.'
  end
end
