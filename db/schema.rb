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

ActiveRecord::Schema.define(version: 20150307234844) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "appointments", force: :cascade do |t|
    t.datetime "time"
    t.string   "location"
    t.integer  "price"
    t.boolean  "c_confirmed", default: false
    t.boolean  "e_confirmed", default: false
    t.integer  "escort_id"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "p_confirmed", default: false
    t.string   "notes",       default: "N/A"
    t.boolean  "cancelled",   default: false
    t.boolean  "no_show",     default: false
  end

  add_index "appointments", ["client_id"], name: "index_appointments_on_client_id", using: :btree
  add_index "appointments", ["escort_id"], name: "index_appointments_on_escort_id", using: :btree

  create_table "clients", force: :cascade do |t|
    t.string   "username",               default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.date     "dob"
    t.string   "line1"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.boolean  "verified",               default: false
    t.string   "token",                  default: "0"
  end

  add_index "clients", ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true, using: :btree
  add_index "clients", ["username"], name: "index_clients_on_username", unique: true, using: :btree

  create_table "escorts", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "name"
    t.date     "dob"
    t.string   "line1"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "height"
    t.string   "weight"
    t.string   "ethnicity"
    t.string   "tit_size"
    t.string   "tit_type"
    t.string   "eyec"
    t.string   "hairc"
    t.boolean  "verified",               default: false
    t.string   "token",                  default: "0"
    t.integer  "price"
    t.boolean  "online",                 default: false
    t.string   "phone"
    t.integer  "security",               default: 0
  end

  add_index "escorts", ["confirmation_token"], name: "index_escorts_on_confirmation_token", unique: true, using: :btree
  add_index "escorts", ["email"], name: "index_escorts_on_email", unique: true, using: :btree
  add_index "escorts", ["reset_password_token"], name: "index_escorts_on_reset_password_token", unique: true, using: :btree
  add_index "escorts", ["username"], name: "index_escorts_on_username", unique: true, using: :btree

  create_table "online_blocks", force: :cascade do |t|
    t.integer  "day"
    t.string   "start_time"
    t.string   "end_time"
    t.integer  "escort_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "online_blocks", ["escort_id"], name: "index_online_blocks_on_escort_id", using: :btree

  add_foreign_key "online_blocks", "escorts"
end
