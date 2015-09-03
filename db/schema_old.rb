# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema_old.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150831163247) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "asset_categories", force: true do |t|
    t.string   "asset_category_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assets", force: true do |t|
    t.string   "asset_name"
    t.string   "asset_description"
    t.float    "asset_price_buy"
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

  create_table "groups", force: true do |t|
    t.string   "group_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grouptemplates", force: true do |t|
    t.integer  "group_id"
    t.integer  "template_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "grouptemplates", ["group_id"], name: "index_grouptemplates_on_group_id", using: :btree
  add_index "grouptemplates", ["template_id"], name: "index_grouptemplates_on_template_id", using: :btree

  create_table "histories", force: true do |t|
    t.integer  "user_id"
    t.string   "action"
    t.string   "view"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "histories", ["user_id"], name: "index_histories_on_user_id", using: :btree

  create_table "templates", force: true do |t|
    t.string   "template_name"
    t.boolean  "permission_write"
    t.boolean  "permission_modify"
    t.boolean  "permission_read"
    t.boolean  "permission_delete"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "name"
    t.string   "father_last_name"
    t.string   "mother_last_name"
    t.string   "home_address"
    t.integer  "group_id"
    t.integer  "usertype"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["group_id"], name: "index_users_on_group_id", using: :btree

end
