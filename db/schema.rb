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

ActiveRecord::Schema.define(version: 2018_10_09_222719) do

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", force: :cascade do |t|
    t.string "name"
    t.integer "cmc"
    t.string "colors"
    t.string "type"
    t.string "supertypes"
    t.string "rarity"
    t.string "text"
    t.string "flavor"
    t.integer "artist_id"
    t.integer "number"
    t.integer "power"
    t.integer "toughness"
    t.string "layout"
    t.string "imagename"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_cards_on_artist_id"
  end

  create_table "cardsubtypes", force: :cascade do |t|
    t.integer "card_id"
    t.integer "type_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_cardsubtypes_on_card_id"
    t.index ["type_id"], name: "index_cardsubtypes_on_type_id"
  end

  create_table "cardtypes", force: :cascade do |t|
    t.integer "card_id"
    t.integer "type_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_cardtypes_on_card_id"
    t.index ["type_id"], name: "index_cardtypes_on_type_id"
  end

  create_table "subtypes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
