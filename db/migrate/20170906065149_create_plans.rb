class CreatePlans < ActiveRecord::Migration[5.0]
  def change
    create_table :plans do |t|
      t.string :name
      t.text :description
      t.integer :duration
      t.decimal :premium_amount
      t.decimal :sum_insured

      t.timestamps
    end
  end
end
