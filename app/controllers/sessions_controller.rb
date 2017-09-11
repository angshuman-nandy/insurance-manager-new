class SessionsController < ApplicationController
  before_action :session_active, only:[:new,:create]

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to dash_welcome_path, flash: {success: "looged in"}
    else
      render "new" , notice: "please enter correct email/password!!"
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
  
end
