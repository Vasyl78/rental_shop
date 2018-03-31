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

ActiveRecord::Schema.define(version: 20180331063742) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.date    "start_date"
    t.date    "end_date"
    t.integer "user_id"
    t.integer "item_id"
    t.index ["item_id"], name: "index_bookings_on_item_id", using: :btree
    t.index ["user_id"], name: "index_bookings_on_user_id", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.string  "name"
    t.integer "user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string  "title"
    t.text    "body"
    t.integer "object_id"
    t.string  "object_type"
    t.integer "user_id"
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
  end

end
