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

ActiveRecord::Schema.define(version: 20140812003415) do

  create_table "alertas", force: true do |t|
    t.integer  "empleado_id"
    t.datetime "fecha_vencimiento"
    t.string   "tipo",              limit: 30
    t.string   "observacion",       limit: 200
    t.boolean  "vencido",                       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "alertas", ["empleado_id"], name: "index_alertas_on_empleado_id", using: :btree

  create_table "empleados", force: true do |t|
    t.string   "nombres",         limit: 50
    t.string   "apellidos",       limit: 50
    t.string   "rut",             limit: 20,              null: false
    t.string   "email",                      default: "", null: false
    t.string   "username",        limit: 10, default: "", null: false
    t.integer  "perfil_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

  add_index "empleados", ["rut"], name: "index_empleados_on_rut", using: :btree

  create_table "perfils", force: true do |t|
    t.string   "tipo",        limit: 30
    t.string   "observacion", limit: 250
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
