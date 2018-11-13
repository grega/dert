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

ActiveRecord::Schema.define(version: 2018_11_13_165950) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "erasure_requests", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email"
    t.string "verify_token"
    t.datetime "verified_at"
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "erasure_requests_properties", id: false, force: :cascade do |t|
    t.uuid "erasure_request_id"
    t.uuid "property_id"
    t.index ["erasure_request_id"], name: "index_erasure_requests_properties_on_erasure_request_id"
    t.index ["property_id"], name: "index_erasure_requests_properties_on_property_id"
  end

  create_table "properties", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.text "notes"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "removal_actions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "notes"
    t.datetime "completed_at"
    t.uuid "erasure_request_id"
    t.uuid "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["erasure_request_id"], name: "index_removal_actions_on_erasure_request_id"
    t.index ["property_id"], name: "index_removal_actions_on_property_id"
  end

end
