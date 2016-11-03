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

ActiveRecord::Schema.define(version: 20161103120432) do

  create_table "clients", force: :cascade do |t|
    t.integer  "kind"
    t.string   "name"
    t.string   "firstname"
    t.string   "email"
    t.string   "adresse"
    t.string   "codePostal"
    t.string   "country"
    t.integer  "age"
    t.integer  "sexe"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "clients", ["email"], name: "index_clients_on_email"

  create_table "representations", force: :cascade do |t|
    t.integer  "cle"
    t.string   "name"
    t.date     "startDate"
    t.time     "startTime"
    t.date     "endDate"
    t.time     "endTime"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "spectacle_id"
  end

  add_index "representations", ["cle"], name: "index_representations_on_cle"
  add_index "representations", ["spectacle_id"], name: "index_representations_on_spectacle_id"

  create_table "spectacles", force: :cascade do |t|
    t.integer  "cle"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "spectacles", ["cle"], name: "index_spectacles_on_cle"

  create_table "tickets", force: :cascade do |t|
    t.integer  "ref"
    t.integer  "command"
    t.integer  "reservation"
    t.date     "resaDate"
    t.time     "resaTime"
    t.float    "price"
    t.date     "accessDate"
    t.time     "accessTime"
    t.string   "tarif"
    t.string   "kind"
    t.string   "serie"
    t.string   "floor"
    t.string   "sellPoint"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "client_id"
    t.integer  "representation_id"
  end

  add_index "tickets", ["client_id"], name: "index_tickets_on_client_id"
  add_index "tickets", ["ref"], name: "index_tickets_on_ref"
  add_index "tickets", ["representation_id"], name: "index_tickets_on_representation_id"

end
