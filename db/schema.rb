# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_02_11_091440) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "creator_categories", force: :cascade do |t|
    t.bigint "creator_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_creator_categories_on_category_id"
    t.index ["creator_id"], name: "index_creator_categories_on_creator_id"
  end

  create_table "creator_infos", force: :cascade do |t|
    t.bigint "creator_id", null: false
    t.string "belongs"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creator_id"], name: "index_creator_infos_on_creator_id"
  end

  create_table "creators", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_creators_on_user_id"
  end

  create_table "user_details", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "slug", null: false
    t.string "name"
    t.integer "gender", null: false
    t.string "introduction"
    t.integer "birth_day_yy"
    t.integer "birth_day_mm"
    t.integer "birth_day_dd"
    t.string "twitter_link"
    t.string "instagram_link"
    t.string "tiktok_link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["slug"], name: "index_user_details_on_slug", unique: true
    t.index ["user_id"], name: "index_user_details_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uid", null: false
    t.string "email", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "creator_categories", "categories"
  add_foreign_key "creator_categories", "creators"
  add_foreign_key "creator_infos", "creators"
  add_foreign_key "creators", "users"
  add_foreign_key "user_details", "users"
end
