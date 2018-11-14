# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20181114014722) do

  create_table "employees", force: :cascade do |t|
    t.string   "address"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "employee_type"
    t.string   "driver_id"
    t.datetime "dob"
    t.string   "uid"
  end

  create_table "requests", force: :cascade do |t|
    t.string "emp_sender_id"
    t.string "emp_receiver_id"
    t.string "shift_id"
    t.text   "comment"
  end

  create_table "shifts", force: :cascade do |t|
    t.string "emp_id"
    t.string "day"
    t.string "shift_type"
    t.string "time"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
