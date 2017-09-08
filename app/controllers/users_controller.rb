class UsersController < ApplicationController
  before_action :get_user, only: [:show, :edit, :update, :destroy]
  before_action :session_active, only: [:new,:create]
  before_action :logged_in_user, only: [:index, :show, :edit, :destroy]

  def show
  end

  def index
    @users = User.all
  end

  def edit
  end

  def destroy
  end

  def new
    @user = User.new
  end

 def update
    if @user.update(user_params)
      redirect_to users_path, notice: "user edited!!"
    else
      render "edit"
    end
  end
  
  def create
    @user = User.new(user_params)
    @user.admin = false
    if @user.save
      redirect_to users_path
    else
      render "new"
    end 
  end

  def get_user
    @user = User.find(params[:id])
  end
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :contact_number, :address, :email, :password, :password_confirmation)
  end

end