class PoliciesController < ApplicationController
  before_action :logged_in_user
  before_action :get_policy, only:[:edit, :update, :destroy, :show] 

  def new
    @plan_id = params[:plan_id] 
    @policy = Policy.new()
  end

  def create
    @policy = Policy.new(policy_params)
    if @policy.save
      redirect_to policies_path, flash: {success: "policy saved!!"}
    else
      render "new"
    end
  end

   def select_company
      @companies = Company.all
   end

   def select_plan
    @plans = Plan.where(company_id: params[:company_id])
  end

  def index
    @policies = Policy.all
  end

  def show
  end

  def edit
  end

  def get_policy
    @plan = Policy.find(params[:id])   
  end
   private

   def policy_params
    params.require(:policy).permit(:holder_name,:policy_type,:description,:plan_id,:user_id, :premium_amount, :commission, :purchase_date, :mature_date, :sum_insured)
  end
end
