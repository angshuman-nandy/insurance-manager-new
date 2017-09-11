class CreatePolicies < ActiveRecord::Migration[5.0]
  def change
    create_table :policies do |t|
      t.string :policy_type
      t.string :description
      t.decimal :sum_insured, null:false
      t.decimal :premium_amount, null:false
      t.decimal :commission, null:false
      t.date :purchase_date, null:false
      t.date :mature_date, null:false

      t.timestamps
    end
  end
end
