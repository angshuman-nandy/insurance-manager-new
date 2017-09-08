class SessionsController < ApplicationController
  before_action :session_active, only:[:new,:create]
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # user page
      log_in user
      redirect_to dash_welcome_path
    else
      render "new"
    end
  end

  def destroy
    log_out
    redirect_to root_url

  end
end
