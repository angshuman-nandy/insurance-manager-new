class PlansController < ApplicationController
  before_action :logged_in_user
  before_action :get_plan, only:[:edit, :update, :destroy, :show] 
  before_action :exclusive_admin, only: [:create, :new, :edit, :destroy]


  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to plans_path, flash: {success: "plan saved!!"}
    else
      render "new"
    end
  end

   def destroy
    @plan.destroy
    redirect_to plans_path, notice: "plan deleted!!"
  end


  def index
    @plans= Plan.all.reorder("Company_id")  
  end

  def new
    @plan = Plan.new
  end


  def update
     if @plan.update(plan_params)
      redirect_to plans_path, flash: {success: "plan edited!!"}
    else
      render "edit"
    end
    
  end


  def get_plan
    @plan = Plan.find(params[:id])   
  end
   private

   def plan_params
    params.require(:plan).permit(:name, :description, :company_id, :premium_amount, :duration, :sum_insured)
  end
end
