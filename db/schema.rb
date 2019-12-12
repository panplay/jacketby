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

ActiveRecord::Schema.define(version: 2019_12_12_055910) do

  create_table "addresses", force: :cascade do |t|
    t.string "name", null: false
    t.string "postal_code", null: false
    t.string "address", null: false
    t.integer "customer_id", null: false
    t.boolean "is_deleted", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["is_deleted"], name: "index_addresses_on_is_deleted"
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "arrival_items", force: :cascade do |t|
    t.integer "arrival_count", null: false
    t.datetime "arrival_time", null: false
    t.integer "item_id", null: false
    t.boolean "is_deleted", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["is_deleted"], name: "index_arrival_items_on_is_deleted"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "is_deleted", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "is_deleted"], name: "index_artists_on_name_and_is_deleted"
  end

  create_table "carts", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "quantity", null: false
    t.integer "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "is_deleted", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["is_deleted"], name: "index_categories_on_is_deleted"
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_kana", null: false
    t.string "first_name_kana", null: false
    t.string "postal_code", null: false
    t.string "address", null: false
    t.string "phone_number", null: false
    t.string "password", null: false
    t.boolean "is_deleted", default: false, null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["is_deleted"], name: "index_customers_on_is_deleted"
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "disks", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "disk_order", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "image_id", null: false
    t.string "name", null: false
    t.integer "artist_id", null: false
    t.integer "price", null: false
    t.string "release_date", null: false
    t.integer "label_id", null: false
    t.integer "category_id", null: false
    t.text "comment"
    t.integer "status", default: 0, null: false
    t.boolean "is_deleted", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "artist_id", "is_deleted"], name: "index_items_on_name_and_artist_id_and_is_deleted"
  end

  create_table "labels", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "is_deleted", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["is_deleted"], name: "index_labels_on_is_deleted"
  end

  create_table "order_details", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "quantity", null: false
    t.integer "tax", null: false
    t.integer "order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "status", default: 0, null: false
    t.integer "payment", null: false
    t.datetime "order_time", null: false
    t.integer "total_price", null: false
    t.integer "delivery_charge", null: false
    t.string "delivery_name", null: false
    t.string "postal_code", null: false
    t.string "destination", null: false
    t.boolean "is_deleted", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["is_deleted"], name: "index_orders_on_is_deleted"
  end

  create_table "songs", force: :cascade do |t|
    t.integer "disk_id", null: false
    t.string "name", null: false
    t.integer "song_order", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
