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

ActiveRecord::Schema.define(version: 20140625021618) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "group_ints", force: true do |t|
    t.string   "location"
    t.integer  "user_id"
    t.datetime "dt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "group_ints", ["user_id"], name: "index_group_ints_on_user_id", using: :btree

  create_table "individual_ints", force: true do |t|
    t.string   "location"
    t.integer  "user_id"
    t.datetime "dt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "individual_ints", ["user_id"], name: "index_individual_ints_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "confirmation_code"
    t.string   "status"
    t.integer  "groupInt_id"
    t.integer  "individualInt_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["groupInt_id"], name: "index_users_on_groupInt_id", using: :btree
  add_index "users", ["individualInt_id"], name: "index_users_on_individualInt_id", using: :btree

end
