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

ActiveRecord::Schema[7.2].define(version: 2012_04_26_221506) do
  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "disciplines", force: :cascade do |t|
    t.string "name"
    t.integer "sport_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "name"
    t.integer "category_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "country"
    t.integer "age"
    t.text "bio"
    t.string "password"
    t.boolean "accepted"
    t.text "gender"
    t.date "dob"
    t.integer "team_id"
    t.string "time_zone"
    t.integer "discipline_id"
    t.string "city"
  end
end
