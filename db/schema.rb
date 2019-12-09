# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_06_182623) do

  create_table "general_lists", force: :cascade do |t|
    t.integer "general_id", null: false
    t.integer "list_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["general_id"], name: "index_general_lists_on_general_id"
    t.index ["list_id"], name: "index_general_lists_on_list_id"
  end

  create_table "generals", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.integer "season"
    t.integer "episode"
    t.date "next_episode_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "my_list"
  end

  create_table "lists", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "general_lists", "generals"
  add_foreign_key "general_lists", "lists"
end
