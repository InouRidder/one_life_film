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

ActiveRecord::Schema.define(version: 20171227125422) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_id", null: false
    t.string "resource_type", null: false
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "bookings", id: :serial, force: :cascade do |t|
    t.string "phone_number"
    t.string "name"
    t.string "email_address"
    t.string "concerns"
    t.string "location_wedding"
    t.string "subject"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date_wedding"
    t.string "status", default: "pending"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "booking_id"
    t.index ["booking_id"], name: "index_playbooks_on_booking_id"
  end

  create_table "playlines", force: :cascade do |t|
    t.bigint "playbook_id"
    t.string "content"
    t.string "location"
    t.time "begin_time"
    t.time "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_number"
    t.index ["playbook_id"], name: "index_playlines_on_playbook_id"
  end

  create_table "song_choices", force: :cascade do |t|
    t.bigint "booking_id"
    t.bigint "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_song_choices_on_booking_id"
    t.index ["song_id"], name: "index_song_choices_on_song_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  add_foreign_key "playlines", "playbooks"
  add_foreign_key "song_choices", "bookings"
  add_foreign_key "song_choices", "songs"
end
