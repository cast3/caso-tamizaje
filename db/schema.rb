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

ActiveRecord::Schema[7.1].define(version: 2023_10_19_042355) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "patients", force: :cascade do |t|
    t.string "identification", default: ""
    t.string "name", default: ""
    t.float "mass", default: 0.0
    t.float "height", default: 0.0
    t.integer "systolic_pressure", default: 0
    t.integer "diastolic_pressure", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identification"], name: "index_patients_on_identification"
  end

end
