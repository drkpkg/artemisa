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

ActiveRecord::Schema.define(version: 20150625172523) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "asset_categories", force: true do |t|
    t.string   "asset_category_description"
    t.integer  "asset_categories_years"
    t.float    "asset_categories_coefficient"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assets", force: true do |t|
    t.string   "asset_name"
    t.string   "asset_description"
    t.date     "asset_date_buy"
    t.float    "asset_price_buy"
    t.float    "asset_price_actual"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assets", ["category_id"], name: "index_assets_on_category_id", using: :btree

  create_table "departments", force: true do |t|
    t.string   "department_name"
    t.string   "department_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", force: true do |t|
    t.integer  "employee_identity"
    t.string   "employee_name"
    t.string   "employee_direction"
    t.integer  "office_id"
    t.integer  "department_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "employees", ["department_id"], name: "index_employees_on_department_id", using: :btree
  add_index "employees", ["office_id"], name: "index_employees_on_office_id", using: :btree

  create_table "groups", force: true do |t|
    t.string   "group_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grouptemplates", force: true do |t|
    t.integer  "group_id"
    t.integer  "template_id"
    t.boolean  "permission_write"
    t.boolean  "permission_modify"
    t.boolean  "permission_read"
    t.boolean  "permission_delete"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "grouptemplates", ["group_id"], name: "index_grouptemplates_on_group_id", using: :btree
  add_index "grouptemplates", ["template_id"], name: "index_grouptemplates_on_template_id", using: :btree

  create_table "templates", force: true do |t|
    t.string   "template_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.integer  "empleado_id"
    t.integer  "group_id"
    t.integer  "usertype"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["empleado_id"], name: "index_users_on_empleado_id", using: :btree
  add_index "users", ["group_id"], name: "index_users_on_group_id", using: :btree

end
