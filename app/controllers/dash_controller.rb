class DashController < ApplicationController
  before_action :logged_in_user
  def welcome
    @c_user=current_user
    if current_user.admin==true
      @policies = Policy.all
      @users = User.all
    else
      @policies = Policy.where(user_id: current_user.id)
    end
    @companies = Company.all
    @plans = Plan.all
  end
end
