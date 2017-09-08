class AddPlanReferenceToPolicies < ActiveRecord::Migration[5.0]
  def change
    add_reference :policies, :plan, foreign_key: true
  end
end
