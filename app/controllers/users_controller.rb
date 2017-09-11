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
    if @user.id != current_user.id
      redirect_to dash_welcome_path
    end
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
    if @user.save
      redirect_to users_path
    else
      render "new"
    end 
  end

  def make_admin
    @usr = User.find(params[:id])
    @usr.admin = true
    if @usr.update_attribute(:admin,"true")
      flash[:notice] = "the user was made admin"
      redirect_to users_path
    else
      flash[:notice] = "the user was not made admin"
      redirect_to users_path
    end
  end 

  def get_user
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :admin, :contact_number, :address, :email, :password, :password_confirmation)
  end

end
