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

ActiveRecord::Schema[7.0].define(version: 2022_09_08_110200) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actions", force: :cascade do |t|
    t.string "title"
    t.string "level"
    t.string "score"
    t.string "category"
    t.string "description"
    t.integer "occurences", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "carbongain", default: 0
    t.string "explication"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "carbonassessments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "bike"
    t.string "bus"
    t.string "plane"
    t.string "car"
    t.string "email"
    t.string "streaming"
    t.string "devise"
    t.string "second_hand"
    t.string "red_meat"
    t.string "white_meat"
    t.string "oil"
    t.string "dairy"
    t.string "house_size"
    t.string "house_heated"
    t.string "renewable_energy"
    t.string "people_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carbonassessments_on_user_id"
  end

  create_table "scores", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "transport_score", default: 0
    t.integer "food_score", default: 0
    t.integer "household_score", default: 0
    t.integer "digital_score", default: 0
    t.integer "total_score", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_scores_on_user_id"
  end

  create_table "user_actions", force: :cascade do |t|
    t.string "status", default: "selected"
    t.integer "user_occurences", default: 0
    t.integer "score"
    t.bigint "user_id", null: false
    t.bigint "action_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
    t.string "title"
    t.integer "carbongain"
    t.index ["action_id"], name: "index_user_actions_on_action_id"
    t.index ["user_id"], name: "index_user_actions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "pseudo"
    t.string "rank_category"
    t.string "transport_level", default: "beginner"
    t.string "home_level", default: "beginner"
    t.string "numeric_level", default: "beginner"
    t.string "food_level", default: "beginner"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "carbonassessments", "users"
  add_foreign_key "scores", "users"
  add_foreign_key "user_actions", "actions"
  add_foreign_key "user_actions", "users"
end
