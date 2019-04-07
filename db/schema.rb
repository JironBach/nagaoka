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

ActiveRecord::Schema.define(version: 20190301103537) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alreadies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "subject2_id", null: false
    t.bigint "user_id", null: false
    t.boolean "already", default: false, null: false
    t.integer "index_id", null: false
    t.string "name", null: false
    t.string "image", null: false
    t.string "link", null: false
    t.index ["subject2_id"], name: "index_alreadies_on_subject2_id"
    t.index ["user_id"], name: "index_alreadies_on_user_id"
  end

  create_table "lecture_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "subject2_id", null: false
    t.string "name", null: false
    t.string "image", null: false
    t.string "link", null: false
  end

  create_table "subject1s", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "link"
  end

  create_table "subject2s", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "index_id", null: false
    t.string "name", null: false
    t.string "link", null: false
    t.boolean "already", default: false, null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
  end

end
