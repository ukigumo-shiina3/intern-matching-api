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

ActiveRecord::Schema[8.0].define(version: 2025_10_27_234127) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"
  enable_extension "pgcrypto"

  create_table "companies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "firebase_uid", null: false
    t.string "name", null: false
    t.string "email", null: false
    t.string "prefecture", null: false
    t.string "municipality", null: false
    t.string "address_line", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entries", force: :cascade do |t|
    t.uuid "intern_id", null: false
    t.bigint "job_id", null: false
    t.string "current_status", default: "応募済み", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "field_of_studies", force: :cascade do |t|
    t.uuid "intern_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interns", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "firebase_uid", null: false
    t.string "field_of_study_id", null: false
    t.string "school_year_id", null: false
    t.string "name", null: false
    t.string "email", null: false
    t.string "school_name", null: false
    t.string "major_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["field_of_study_id", "school_year_id"], name: "index_interns_on_field_of_study_id_and_school_year_id", unique: true
    t.index ["field_of_study_id"], name: "index_interns_on_field_of_study_id"
    t.index ["firebase_uid"], name: "index_interns_on_firebase_uid", unique: true
    t.index ["school_year_id"], name: "index_interns_on_school_year_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.uuid "company_id", null: false
    t.string "title", null: false
    t.string "web_url", null: false
    t.text "intern_conditions", null: false
    t.boolean "is_published", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "room_id", null: false
    t.uuid "intern_id"
    t.uuid "company_id"
    t.text "content", null: false
    t.datetime "read_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.uuid "intern_id", null: false
    t.uuid "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["intern_id", "company_id"], name: "index_rooms_on_intern_id_and_company_id", unique: true
  end

  create_table "school_years", force: :cascade do |t|
    t.uuid "intern_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
