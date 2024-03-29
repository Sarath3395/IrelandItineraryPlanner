# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_03_042150) do

  create_table "hotels", force: :cascade do |t|
    t.string "name"
    t.string "roomtype"
    t.datetime "fromdate"
    t.string "coordinates"
    t.string "address"
    t.datetime "todate"
    t.string "price"
    t.string "noofrooms"
    t.string "noofperson"
    t.string "bedtype"
    t.integer "location_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "rank"
    t.index ["location_id"], name: "index_hotels_on_location_id"
  end

  create_table "liked_hotels", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "hotel_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hotel_id"], name: "index_liked_hotels_on_hotel_id"
    t.index ["user_id"], name: "index_liked_hotels_on_user_id"
  end

  create_table "liked_locations", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "location_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_liked_locations_on_location_id"
    t.index ["user_id"], name: "index_liked_locations_on_user_id"
  end

  create_table "liked_restaurants", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "restaurant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_liked_restaurants_on_restaurant_id"
    t.index ["user_id"], name: "index_liked_restaurants_on_user_id"
  end

  create_table "liked_transports", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "transport_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["transport_id"], name: "index_liked_transports_on_transport_id"
    t.index ["user_id"], name: "index_liked_transports_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "scrapper_id"
    t.string "transcrapper_id"
    t.string "restscrapper_id"
  end

  create_table "report_errors", force: :cascade do |t|
    t.string "errormessage"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "assignstatus"
    t.index ["user_id"], name: "index_report_errors_on_user_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "foodtype"
    t.string "price"
    t.integer "location_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_restaurants_on_location_id"
  end

  create_table "transports", force: :cascade do |t|
    t.string "name"
    t.string "transporttype"
    t.string "origin"
    t.string "destination"
    t.datetime "departure"
    t.datetime "arrival"
    t.string "price"
    t.integer "location_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_transports_on_location_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "provider"
    t.string "uid"
    t.boolean "admin"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "hotels", "locations"
  add_foreign_key "liked_hotels", "hotels"
  add_foreign_key "liked_hotels", "users"
  add_foreign_key "liked_locations", "locations"
  add_foreign_key "liked_locations", "users"
  add_foreign_key "liked_restaurants", "restaurants"
  add_foreign_key "liked_restaurants", "users"
  add_foreign_key "liked_transports", "transports"
  add_foreign_key "liked_transports", "users"
  add_foreign_key "report_errors", "users"
  add_foreign_key "restaurants", "locations"
  add_foreign_key "transports", "locations"
end
