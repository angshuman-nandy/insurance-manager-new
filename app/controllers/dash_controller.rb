class DashController < ApplicationController
  before_action :logged_in_user
  def welcome
    @c_user=current_user
  end
end
