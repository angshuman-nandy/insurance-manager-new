# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170907161554) do

  create_table "companies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "plans", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description",    limit: 65535
    t.integer  "duration"
    t.decimal  "premium_amount",               precision: 10
    t.decimal  "sum_insured",                  precision: 10
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "company_id"
    t.index ["company_id"], name: "index_plans_on_company_id", using: :btree
  end

  create_table "policies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "holder_name",                   null: false
    t.string   "policy_type"
    t.string   "description"
    t.decimal  "sum_insured",    precision: 10, null: false
    t.decimal  "premium_amount", precision: 10, null: false
    t.decimal  "commission",     precision: 10, null: false
    t.date     "purchase_date",                 null: false
    t.date     "mature_date",                   null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "user_id"
    t.integer  "poltype_id"
    t.integer  "plan_id"
    t.index ["plan_id"], name: "index_policies_on_plan_id", using: :btree
    t.index ["poltype_id"], name: "index_policies_on_poltype_id", using: :btree
    t.index ["user_id"], name: "index_policies_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name",      null: false
    t.string   "last_name"
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.boolean  "admin"
    t.string   "contact_number"
    t.string   "address"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "plans", "companies"
  add_foreign_key "policies", "plans"
  add_foreign_key "policies", "users"
end
