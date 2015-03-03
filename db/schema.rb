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

ActiveRecord::Schema.define(version: 20150302225935) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "funding_goal"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "time"
    t.integer  "restaurant_id"
    t.integer  "user_id"
    t.integer  "party_size"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "reservations", ["restaurant_id"], name: "index_reservations_on_restaurant_id", using: :btree
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id", using: :btree

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.text     "description"
    t.integer  "capacity"
    t.time     "hours_open"
    t.time     "hours_closed"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "rewards", force: :cascade do |t|
    t.text     "description"
    t.integer  "pledge_amount"
    t.integer  "campaign_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "rewards", ["campaign_id"], name: "index_rewards_on_campaign_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "reservations", "restaurants"
  add_foreign_key "reservations", "users"
  add_foreign_key "rewards", "campaigns"
end
