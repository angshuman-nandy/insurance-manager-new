class CompaniesController < ApplicationController
  before_action :logged_in_user
  before_action :get_company, only:[:edit, :update, :destroy, :show]
   before_action :exclusive_admin, only: [:create, :new, :edit, :destroy]
  
  def index
    @companies = Company.all
  end

  def show
  end
    
  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to companies_path, flash: {success: "company created"}
    else
      render "new"
    end
  end

  def new
    @company = Company.new
  end

  def edit
  end
      

  def update
    if @company.update(company_params)
      redirect_to companies_path, notice: "company edited!!"
    else
      render "edit"
    end
  end
  
  def destroy
    @company.destroy
    redirect_to companies_path, notice: "company deleted!!"
  end

  def get_company
    @company = Company.find(params[:id])
  end


 private

  def company_params
    params.require(:company).permit(:name, :description)
  end

end
