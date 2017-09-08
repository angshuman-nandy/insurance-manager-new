class AddCompanyRefToPlans < ActiveRecord::Migration[5.0]
  def change
    add_reference :plans, :company, foreign_key: true
  end
end
