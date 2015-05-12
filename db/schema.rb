# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150512032024) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "organisations", force: :cascade do |t|
    t.string "adjustment_identifier"
    t.string "adjustment_type"
    t.string "stage"
    t.string "title"
    t.string "account_code"
    t.string "account_description"
    t.string "line_description"
    t.string "department_code"
    t.string "department_description"
    t.string "time"
    t.string "counterparty_code"
    t.string "counterparty_description"
    t.string "programme_object_code"
    t.string "programme_object_description"
    t.string "data_type"
    t.string "data_type_description"
    t.string "accounting_authority"
    t.string "accounts_capital_current"
    t.string "activity_code"
    t.string "budget_boundary"
    t.string "budget_capital_current"
    t.string "resource_capital"
    t.string "programme_admin"
    t.string "cash_items"
    t.string "cfer_income"
    t.string "cfer_resource"
    t.string "cga_body_type"
    t.string "cofog"
    t.string "dept_group"
    t.string "estimate_line"
    t.string "esa"
    t.string "eu"
    t.string "income_category"
    t.string "lg"
    t.string "lg_body_type"
    t.string "estimate_number"
    t.string "gross_income"
    t.string "line"
    t.string "line_last_year"
    t.string "line_next_year"
    t.string "nac"
    t.string "nhs_body_type"
    t.string "noncash_items"
    t.string "ocs"
    t.string "pc_body_type"
    t.string "pesa_1_1"
    t.string "pesa_current_grants"
    t.string "pesa_delivery"
    t.string "pesa_services"
    t.string "pesa_transfer"
    t.string "request_for_resources"
    t.string "sector"
    t.string "signage"
    t.string "territory"
    t.string "cbal"
    t.string "local_government_use"
    t.string "local_government_use_only"
    t.string "net_subhead"
    t.string "non_id_exceptions"
    t.string "notocs"
    t.string "obal"
    t.string "pesa_1_1_nat_lottery"
    t.string "pesa_1_1_tax_credits"
    t.string "pesa_1_2_nhs"
    t.string "pesa_bbc"
    t.string "pesa_stu_loans"
    t.string "bad_debts"
    t.string "amount"
  end

end
