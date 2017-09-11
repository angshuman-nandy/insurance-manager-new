class PoliciesController < ApplicationController
  before_action :logged_in_user
  before_action :get_policy, only:[:edit, :update, :destroy, :show] 

  def new
    @plan_id = params[:plan_id]
    if(@plan_id.nil?)
       redirect_to policies_select_company_path   
    else
      @plan = Plan.find(@plan_id) 
      @users = User.all
      @policy = Policy.new()
    end
  end

  def create
    @policy = Policy.new(policy_params)
    @p_id = @policy.plan_id
    @plan = Plan.find(@p_id) 
    @users = User.all
    if @policy.save
      UserMailer.policy_email(@user,@policy).deliver_later
      redirect_to policies_path, flash: {success: "policy saved!!"}
    else
      render "new"
    end
  end

   def select_company
      @companies = Company.all
   end

   def select_plan
    @company_id = params[:company_id]
    if @company_id.nil?
      redirect_to policies_select_company_path
    else
    @plans = Plan.where(company_id: @company_id)
    end  
  end

  def index
    if current_user.admin==true
      @policies = Policy.all
    else
      @policies = Policy.where(user_id: current_user.id)
    end
  end

  def show
  end

  def edit
     @plan_id = @policy.plan_id
    if(@plan_id.nil?)
       redirect_to policies_select_company_path   
    else
      @plan = Plan.find(@plan_id) 
      @users = User.all
      @policy = Policy.new()
    end
  end

  def get_policy
    @policy = Policy.find(params[:id])   
  end
   private

   def policy_params
    params.require(:policy).permit(:holder_name,:policy_type,:description,:plan_id,:user_id, :premium_amount, :commission, :purchase_date, :mature_date, :sum_insured)
  end
end
