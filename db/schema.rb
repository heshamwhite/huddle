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

ActiveRecord::Schema.define(version: 20150507142004) do

  create_table "interests", force: :cascade do |t|
    t.string   "interestname", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "interests_users", force: :cascade do |t|
    t.integer "user_id",     limit: 4
    t.integer "interest_id", limit: 4
  end

  add_index "interests_users", ["interest_id"], name: "index_interests_users_on_interest_id", using: :btree
  add_index "interests_users", ["user_id"], name: "index_interests_users_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",            limit: 255
    t.string   "hashedpassword",      limit: 255
    t.integer  "age",                 limit: 4
    t.text     "bio",                 limit: 65535
    t.string   "email",               limit: 255
    t.integer  "isconfirm",           limit: 4
    t.integer  "usertype",            limit: 4
    t.integer  "interest_id",         limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["interest_id"], name: "index_users_on_interest_id", using: :btree

  add_foreign_key "users", "interests"
end
