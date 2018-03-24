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

ActiveRecord::Schema.define(version: 20180321055645) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", id: :serial, force: :cascade do |t|
    t.string "phone_number"
    t.string "phone_number_partner"
    t.string "name"
    t.string "email_address"
    t.string "location_wedding"
    t.date "date_wedding"
    t.string "subject"
    t.string "state", default: "pending"
    t.boolean "filmed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "groom_number"
    t.string "dress_code"
    t.bigint "request_id"
    t.index ["request_id"], name: "index_bookings_on_request_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.string "author"
    t.integer "commentable_id"
    t.string "commentable_type"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "films", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "video_url"
    t.text "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password"
    t.boolean "promo", default: false
    t.string "poster"
    t.bigint "booking_id"
    t.index ["booking_id"], name: "index_films_on_booking_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "playbooks", force: :cascade do |t|
    t.bigint "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "allowed_songs", default: 3
    t.index ["booking_id"], name: "index_playbooks_on_booking_id"
  end

  create_table "playlines", force: :cascade do |t|
    t.bigint "playbook_id"
    t.string "content"
    t.string "begin_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_number"
    t.string "contact"
    t.string "phone_number"
    t.string "city"
    t.string "address"
    t.index ["playbook_id"], name: "index_playlines_on_playbook_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "phone_number"
    t.string "name"
    t.string "email_address"
    t.string "location_wedding"
    t.string "subject"
    t.string "message"
    t.string "source_reference"
    t.date "date_wedding"
    t.string "state", default: "pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "song_choices", force: :cascade do |t|
    t.bigint "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "artist"
    t.bigint "playbook_id"
    t.index ["playbook_id"], name: "index_song_choices_on_playbook_id"
    t.index ["song_id"], name: "index_song_choices_on_song_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "artist"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "requests"
  add_foreign_key "films", "bookings"
  add_foreign_key "playbooks", "bookings"
  add_foreign_key "playlines", "playbooks"
  add_foreign_key "song_choices", "playbooks"
  add_foreign_key "song_choices", "songs"
end
