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

ActiveRecord::Schema.define(version: 0) do

  create_table "Admin", primary_key: "eID", force: :cascade do |t|
  end

  create_table "Bed", primary_key: "bID", force: :cascade do |t|
    t.integer "roomID", limit: 4, null: false
  end

  add_index "Bed", ["roomID"], name: "roomID", using: :btree

  create_table "Doctor", primary_key: "eID", force: :cascade do |t|
  end

  create_table "DrugIntakeEvent", id: false, force: :cascade do |t|
    t.integer "time_hours", limit: 4,  default: 0, null: false
    t.date    "di_date",                           null: false
    t.integer "d_dosage",   limit: 4
    t.integer "eID",        limit: 4,              null: false
    t.string  "mname",      limit: 55,             null: false
    t.integer "careCardNo", limit: 8,              null: false
  end

  add_index "DrugIntakeEvent", ["eID"], name: "eID", using: :btree
  add_index "DrugIntakeEvent", ["mname"], name: "mname", using: :btree

  create_table "HospitalStaff", primary_key: "eID", force: :cascade do |t|
    t.string "e_fname", limit: 30
    t.string "e_lname", limit: 30
  end

  create_table "Medication", primary_key: "mname", force: :cascade do |t|
  end

  create_table "Nurse", primary_key: "eID", force: :cascade do |t|
  end

  create_table "Patient", primary_key: "careCardNo", force: :cascade do |t|
    t.string  "p_fname",      limit: 30
    t.string  "p_lname",      limit: 30
    t.integer "bID",          limit: 4,  null: false
    t.string  "p_condition",  limit: 30
    t.integer "phone_number", limit: 8
    t.integer "d_id",         limit: 4,  null: false
    t.integer "n_id",         limit: 4,  null: false
  end

  add_index "Patient", ["bID"], name: "bID", using: :btree
  add_index "Patient", ["d_id"], name: "d_id", using: :btree
  add_index "Patient", ["n_id"], name: "n_id", using: :btree

  create_table "Prescription", id: false, force: :cascade do |t|
    t.string  "mname",      limit: 55, default: "", null: false
    t.integer "careCardNo", limit: 8,  default: 0,  null: false
    t.integer "p_dosage",   limit: 4
    t.integer "p_interval", limit: 4
    t.integer "eID",        limit: 4,               null: false
    t.date    "last_taken"
    t.date    "p_date"
  end

  add_index "Prescription", ["eID"], name: "eID", using: :btree
  add_index "Prescription", ["mname"], name: "mname", using: :btree

  create_table "Room", primary_key: "roomID", force: :cascade do |t|
  end

  add_foreign_key "Admin", "HospitalStaff", column: "eID", primary_key: "eID", name: "Admin_ibfk_1"
  add_foreign_key "Bed", "Room", column: "roomID", primary_key: "roomID", name: "Bed_ibfk_1"
  add_foreign_key "Doctor", "HospitalStaff", column: "eID", primary_key: "eID", name: "Doctor_ibfk_1"
  add_foreign_key "DrugIntakeEvent", "Medication", column: "mname", primary_key: "mname", name: "DrugIntakeEvent_ibfk_2"
  add_foreign_key "DrugIntakeEvent", "Nurse", column: "eID", primary_key: "eID", name: "DrugIntakeEvent_ibfk_1"
  add_foreign_key "DrugIntakeEvent", "Patient", column: "careCardNo", primary_key: "careCardNo", name: "DrugIntakeEvent_ibfk_3"
  add_foreign_key "Nurse", "HospitalStaff", column: "eID", primary_key: "eID", name: "Nurse_ibfk_1"
  add_foreign_key "Patient", "Bed", column: "bID", primary_key: "bID", name: "Patient_ibfk_1"
  add_foreign_key "Patient", "Doctor", column: "d_id", primary_key: "eID", name: "Patient_ibfk_3"
  add_foreign_key "Patient", "Nurse", column: "n_id", primary_key: "eID", name: "Patient_ibfk_2"
  add_foreign_key "Prescription", "Doctor", column: "eID", primary_key: "eID", name: "Prescription_ibfk_3"
  add_foreign_key "Prescription", "Medication", column: "mname", primary_key: "mname", name: "Prescription_ibfk_2"
  add_foreign_key "Prescription", "Patient", column: "careCardNo", primary_key: "careCardNo", name: "Prescription_ibfk_1"
end
