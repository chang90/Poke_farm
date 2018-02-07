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

ActiveRecord::Schema.define(version: 20180207041747) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "experiences", force: :cascade do |t|
    t.string "growth_rate"
    t.integer "level"
    t.integer "experience"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "habitats", force: :cascade do |t|
    t.string "identifier"
    t.integer "rarity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "my_pokemons", force: :cascade do |t|
    t.bigint "species_id"
    t.string "nickname"
    t.integer "level"
    t.integer "exp"
    t.string "growth_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "ready_for_evolution"
    t.integer "user_id"
    t.bigint "team_id"
    t.integer "team_order"
    t.index ["species_id"], name: "index_my_pokemons_on_species_id"
    t.index ["team_id"], name: "index_my_pokemons_on_team_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "img_url"
  end

  create_table "species", force: :cascade do |t|
    t.string "identifier"
    t.integer "evolves_from_species_id"
    t.integer "evolution_chain_id"
    t.integer "evolution_min_level"
    t.integer "height"
    t.integer "weight"
    t.string "color"
    t.string "shape"
    t.integer "species_habitats_relationship_id"
    t.integer "capture_rate"
    t.string "growth_rate"
    t.string "img_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "species_habitats_relationships", force: :cascade do |t|
    t.bigint "species_id"
    t.bigint "habitat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["habitat_id"], name: "index_species_habitats_relationships_on_habitat_id"
    t.index ["species_id"], name: "index_species_habitats_relationships_on_species_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "start_time"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ball"
    t.integer "money"
  end

  add_foreign_key "my_pokemons", "species"
  add_foreign_key "my_pokemons", "teams"
  add_foreign_key "species_habitats_relationships", "habitats"
  add_foreign_key "species_habitats_relationships", "species"
end
