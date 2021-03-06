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

ActiveRecord::Schema.define(version: 2021_03_31_190806) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.bigint "events_id"
    t.bigint "users_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["events_id"], name: "index_attendances_on_events_id"
    t.index ["users_id"], name: "index_attendances_on_users_id"
  end

  create_table "category_rulesets", force: :cascade do |t|
    t.integer "points"
    t.bigint "member_category_id", null: false
    t.bigint "event_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_type_id"], name: "index_category_rulesets_on_event_type_id"
    t.index ["member_category_id"], name: "index_category_rulesets_on_member_category_id"
  end

  create_table "event_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "event_name"
    t.string "event_description"
    t.datetime "date"
    t.string "location"
    t.string "passcode_hash"
    t.string "passcode_salt"
    t.boolean "is_open"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "event_type_id", null: false
    t.index ["event_type_id"], name: "index_events_on_event_type_id"
  end

  create_table "member_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "default_for", default: 0
  end

  create_table "user_infos", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "member_status"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "member_category_id"
    t.index ["member_category_id"], name: "index_user_infos_on_member_category_id"
    t.index ["user_id"], name: "index_user_infos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "role", default: 2
    t.bigint "user_infos_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["user_infos_id"], name: "index_users_on_user_infos_id"
  end

  add_foreign_key "category_rulesets", "event_types"
  add_foreign_key "category_rulesets", "member_categories"
  add_foreign_key "events", "event_types"
  add_foreign_key "user_infos", "member_categories"
  add_foreign_key "user_infos", "users"
  add_foreign_key "users", "user_infos", column: "user_infos_id"
end
