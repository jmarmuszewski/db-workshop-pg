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

ActiveRecord::Schema.define(version: 20160916215345) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bans", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "email"
    t.text     "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bans_on_user_id", using: :btree
  end

  create_table "order_lists", force: :cascade do |t|
    t.integer  "price_id"
    t.integer  "order_id"
    t.integer  "quantity"
    t.integer  "discount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_lists_on_order_id", using: :btree
    t.index ["price_id"], name: "index_order_lists_on_price_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "document_name"
    t.boolean  "finalized"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "prices", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "price_pln"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_prices_on_product_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "available"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.date     "date_of_birth"
    t.string   "password"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_foreign_key "bans", "users"
  add_foreign_key "order_lists", "orders"
  add_foreign_key "order_lists", "prices"
  add_foreign_key "orders", "users"
  add_foreign_key "prices", "products"
  add_foreign_key "sessions", "users"
end
