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

ActiveRecord::Schema.define(version: 20170518000128) do

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "desc"
    t.string   "addr_1"
    t.string   "addr_2"
    t.string   "addr_city"
    t.string   "addr_code"
    t.string   "addr_state"
    t.string   "addr_country"
    t.string   "phone_1"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.string   "reviewer_name"
    t.string   "reviewer_email"
    t.text     "review"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["restaurant_id"], name: "index_reviews_on_restaurant_id"
  end

end
