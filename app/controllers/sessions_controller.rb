class SessionsController < ApplicationController
  def new
  end

  def create 
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
    else 
      Rails.logger.debug "Log in failed."
    end
  end

  def destroy 
    log_out 
  end
end
