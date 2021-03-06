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

ActiveRecord::Schema.define(version: 20140728160636) do

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "detectives", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "instance_id"
    t.string   "name"
    t.string   "lastname"
  end

  add_index "detectives", ["email"], name: "index_detectives_on_email", unique: true
  add_index "detectives", ["reset_password_token"], name: "index_detectives_on_reset_password_token", unique: true

  create_table "evidences", force: true do |t|
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "instance_id"
  end

  create_table "guests", force: true do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "ocupation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "instance_id"
    t.boolean  "victim",      default: false
    t.boolean  "suspect",     default: false
  end

  create_table "instances", force: true do |t|
    t.string   "name"
    t.string   "victim"
    t.datetime "date"
    t.string   "place"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "detective_id"
    t.boolean  "state",        default: false
    t.datetime "date_close"
  end

  create_table "instances_places", id: false, force: true do |t|
    t.integer "instance_id"
    t.integer "place_id"
  end

  create_table "instances_weapons", id: false, force: true do |t|
    t.integer "instance_id"
    t.integer "weapon_id"
  end

  create_table "notes", force: true do |t|
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "instance_id"
  end

  create_table "people", force: true do |t|
    t.string   "nombre"
    t.integer  "edad"
    t.string   "ocupacion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "places", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weapons", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
