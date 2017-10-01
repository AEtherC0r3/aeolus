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

ActiveRecord::Schema.define(version: 20171001083501) do

  create_table "climate_control_units", force: :cascade do |t|
    t.string "name"
    t.integer "kind"
    t.integer "room_id"
    t.integer "slot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_climate_control_units_on_room_id"
    t.index ["slot_id"], name: "index_climate_control_units_on_slot_id"
  end

  create_table "data_points", force: :cascade do |t|
    t.integer "kind"
    t.float "value"
    t.integer "room_id"
    t.integer "node_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["node_id"], name: "index_data_points_on_node_id"
    t.index ["room_id"], name: "index_data_points_on_room_id"
  end

  create_table "nodes", force: :cascade do |t|
    t.integer "capabilities"
    t.string "api_key"
    t.integer "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "outside"
    t.index ["room_id"], name: "index_nodes_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "enabled"
  end

  create_table "slots", force: :cascade do |t|
    t.integer "kind"
    t.integer "node_id"
    t.integer "climate_control_unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["climate_control_unit_id"], name: "index_slots_on_climate_control_unit_id"
    t.index ["node_id"], name: "index_slots_on_node_id"
  end

  create_table "targets", force: :cascade do |t|
    t.integer "kind"
    t.float "value"
    t.integer "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_targets_on_room_id"
  end

end
