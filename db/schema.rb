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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131007041007) do

  create_table "alquilers", :force => true do |t|
    t.integer  "usuario_id"
    t.boolean  "cancha_a"
    t.boolean  "cancha_b"
    t.date     "fecha_alquiler"
    t.string   "descripcion"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "canchas", :force => true do |t|
    t.string   "nombre"
    t.float    "monto"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "futboladas", :force => true do |t|
    t.integer  "usuario_id"
    t.date     "fecha_ingreso"
    t.boolean  "cancha_a"
    t.boolean  "cancha_b"
    t.string   "hora_inicio"
    t.integer  "cant_horas"
    t.text     "descripcion"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "status"
    t.boolean  "cancha_c"
    t.string   "numero"
  end

  create_table "reserva_canchas", :force => true do |t|
    t.integer  "reserva_id"
    t.integer  "cancha_id"
    t.float    "monto"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "hora_ini"
    t.integer  "cant_horas"
  end

  create_table "reservas", :force => true do |t|
    t.integer  "usuario_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "status"
    t.date     "fecha_ingreso"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "nombre"
    t.string   "apellido"
    t.integer  "cedula"
    t.string   "telefono"
    t.string   "tipo"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "usuarios", ["confirmation_token"], :name => "index_usuarios_on_confirmation_token", :unique => true
  add_index "usuarios", ["email"], :name => "index_usuarios_on_email", :unique => true
  add_index "usuarios", ["reset_password_token"], :name => "index_usuarios_on_reset_password_token", :unique => true

end
