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

ActiveRecord::Schema.define(version: 20150510192534) do

  create_table "eventcomments", force: :cascade do |t|
    t.text     "body",       limit: 65535
    t.integer  "user_id",    limit: 4
    t.integer  "event_id",   limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "eventcomments", ["event_id"], name: "index_eventcomments_on_event_id", using: :btree
  add_index "eventcomments", ["user_id"], name: "index_eventcomments_on_user_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.float    "lat",        limit: 24
    t.float    "log",        limit: 24
    t.text     "desc",       limit: 65535
    t.datetime "date"
    t.integer  "group_id",   limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "events", ["group_id"], name: "index_events_on_group_id", using: :btree

  create_table "events_users", id: false, force: :cascade do |t|
    t.integer "user_id",  limit: 4
    t.integer "event_id", limit: 4
  end

  add_index "events_users", ["user_id", "event_id"], name: "index_events_users_on_user_id_and_event_id", using: :btree

  create_table "groupimages", force: :cascade do |t|
    t.integer  "group_id",            limit: 4
    t.text     "desc",                limit: 65535
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "gimage_file_name",    limit: 255
    t.string   "gimage_content_type", limit: 255
    t.integer  "gimage_file_size",    limit: 4
    t.datetime "gimage_updated_at"
  end

  add_index "groupimages", ["group_id"], name: "index_groupimages_on_group_id", using: :btree

  create_table "groupmessages", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "body",       limit: 65535
    t.integer  "user_id",    limit: 4
    t.integer  "group_id",   limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "groupmessages", ["group_id"], name: "index_groupmessages_on_group_id", using: :btree
  add_index "groupmessages", ["user_id"], name: "index_groupmessages_on_user_id", using: :btree

  create_table "groupreplies", force: :cascade do |t|
    t.text     "body",            limit: 65535
    t.integer  "user_id",         limit: 4
    t.integer  "groupmessage_id", limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "groupreplies", ["groupmessage_id"], name: "index_groupreplies_on_groupmessage_id", using: :btree
  add_index "groupreplies", ["user_id"], name: "index_groupreplies_on_user_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name",                     limit: 255
    t.float    "lat",                      limit: 53
    t.float    "log",                      limit: 53
    t.text     "desc",                     limit: 65535
    t.string   "membertitle",              limit: 255
    t.integer  "user_id",                  limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "groupavatar_file_name",    limit: 255
    t.string   "groupavatar_content_type", limit: 255
    t.integer  "groupavatar_file_size",    limit: 4
    t.datetime "groupavatar_updated_at"
    t.string   "bgimage_file_name",        limit: 255
    t.string   "bgimage_content_type",     limit: 255
    t.integer  "bgimage_file_size",        limit: 4
    t.datetime "bgimage_updated_at"
  end

  add_index "groups", ["user_id"], name: "index_groups_on_user_id", using: :btree

  create_table "groups_interests", id: false, force: :cascade do |t|
    t.integer "group_id",    limit: 4
    t.integer "interest_id", limit: 4
  end

  add_index "groups_interests", ["group_id", "interest_id"], name: "index_groups_interests_on_group_id_and_interest_id", using: :btree

  create_table "groups_users", force: :cascade do |t|
    t.integer "user_id",  limit: 4
    t.integer "group_id", limit: 4
  end

  add_index "groups_users", ["group_id"], name: "index_groups_users_on_group_id", using: :btree
  add_index "groups_users", ["user_id"], name: "index_groups_users_on_user_id", using: :btree

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

  create_table "notifications", force: :cascade do |t|
    t.string   "body",       limit: 255
    t.string   "url",        limit: 255
    t.string   "type",       limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.boolean  "seen",       limit: 1
  end

  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id", using: :btree

  create_table "usermessages", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "body",        limit: 65535
    t.integer  "sender_id",   limit: 4
    t.integer  "receiver_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "seen",        limit: 1
  end

  add_index "usermessages", ["receiver_id"], name: "receiver_id", using: :btree
  add_index "usermessages", ["sender_id"], name: "sender_id", using: :btree

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
    t.string   "password_salt",       limit: 255
    t.float    "latitude",            limit: 24
    t.float    "longitude",           limit: 24
  end

  add_index "users", ["interest_id"], name: "index_users_on_interest_id", using: :btree

  add_foreign_key "eventcomments", "events"
  add_foreign_key "eventcomments", "users"
  add_foreign_key "events", "groups"
  add_foreign_key "groupimages", "groups"
  add_foreign_key "groupmessages", "groups"
  add_foreign_key "groupmessages", "users"
  add_foreign_key "groupreplies", "groupmessages"
  add_foreign_key "groupreplies", "users"
  add_foreign_key "groups", "users"
  add_foreign_key "notifications", "users"
  add_foreign_key "usermessages", "users", column: "receiver_id", name: "receiver_constraint_1"
  add_foreign_key "usermessages", "users", column: "sender_id", name: "sender_constraint_1"
  add_foreign_key "users", "interests"
end
