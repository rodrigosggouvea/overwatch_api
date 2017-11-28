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

ActiveRecord::Schema.define(version: 20171127233200) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abilities", force: :cascade do |t|
    t.bigint "hero_id"
    t.string "name"
    t.text "description"
    t.boolean "is_ultimate"
    t.integer "overwatch_api_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hero_id"], name: "index_abilities_on_hero_id"
  end

  create_table "heros", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "health"
    t.integer "armour"
    t.integer "shield"
    t.string "real_name"
    t.integer "age"
    t.integer "height"
    t.string "affiliation"
    t.string "base_of_operations"
    t.integer "difficulty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "overwatch_api_id"
  end

  add_foreign_key "abilities", "heros"
end
