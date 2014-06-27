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

ActiveRecord::Schema.define(version: 20140627025508) do

  create_table "hotels", force: true do |t|
    t.string   "hotel"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "hotel_name"
    t.string   "hotel_street"
    t.string   "hotel_city"
    t.string   "hotel_state"
    t.string   "hotel_zip"
    t.string   "hotel_phone"
    t.string   "hotel_email"
    t.float    "hotel_lat"
    t.float    "hotel_lng"
    t.string   "hotel_image_url"
    t.boolean  "hotel_pets"
    t.integer  "hotel_pet_fee"
    t.boolean  "hotel_smoking"
    t.integer  "hotel_smoking_fee"
    t.string   "hotel_type"
    t.string   "hotel_region"
    t.integer  "hotel_parking_fee"
  end

  create_table "reports", force: true do |t|
    t.string   "report"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "report_type"
    t.string   "report_format"
  end

  create_table "reservations", force: true do |t|
    t.string   "reservation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "hotel_id"
    t.string   "visitor_name"
    t.string   "visitor_street"
    t.string   "visitor_city"
    t.string   "visitor_state"
    t.string   "visitor_zip"
    t.string   "room_type"
    t.integer  "nights"
    t.integer  "rooms"
    t.integer  "adults"
    t.integer  "children"
    t.boolean  "pets"
    t.boolean  "smoking"
  end

  create_table "users", force: true do |t|
    t.string   "user"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_email"
    t.boolean  "user_is_manager"
    t.boolean  "user_is_superadmin"
  end

end
