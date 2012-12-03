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

ActiveRecord::Schema.define(:version => 20120830193557) do

  create_table "addresses", :force => true do |t|
    t.string   "logradouro"
    t.string   "numero"
    t.string   "complemento"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "estado"
    t.string   "cep"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "cidades", :id => false, :force => true do |t|
    t.integer "id",                                   :null => false
    t.integer "estado",               :default => 0,  :null => false
    t.string  "uf",     :limit => 4,  :default => "", :null => false
    t.string  "nome",   :limit => 50, :default => "", :null => false
  end

  add_index "cidades", ["id"], :name => "id", :unique => true
  add_index "cidades", ["id"], :name => "id_2"

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "fantasy_name"
    t.string   "cnpj"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "cod_cliente"
    t.string   "color"
  end

  create_table "credentials", :force => true do |t|
    t.integer  "participant_id"
    t.integer  "event_id"
    t.integer  "bar_code"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "credentials", ["event_id"], :name => "index_credentials_on_event_id"
  add_index "credentials", ["participant_id"], :name => "index_credentials_on_participant_id"

  create_table "entrances", :force => true do |t|
    t.integer  "credential_id"
    t.integer  "room_id"
    t.boolean  "was_allowed"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "entrances", ["credential_id"], :name => "index_entrances_on_credential_id"
  add_index "entrances", ["room_id"], :name => "index_entrances_on_room_id"

  create_table "estados", :force => true do |t|
    t.string "uf",   :limit => 10, :default => "", :null => false
    t.string "nome", :limit => 20, :default => "", :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.boolean  "is_active"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.boolean  "is_company_event"
    t.integer  "photo_id"
  end

  add_index "events", ["photo_id"], :name => "index_events_on_photo_id"

  create_table "participants", :force => true do |t|
    t.string   "name"
    t.string   "birth"
    t.integer  "address_id"
    t.string   "main_phone"
    t.string   "secondary_phone"
    t.string   "cpf"
    t.string   "email"
    t.string   "sex"
    t.string   "occupation"
    t.string   "marital_status"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "obs1"
    t.string   "obs2"
    t.integer  "photo_id"
    t.integer  "company_id"
  end

  add_index "participants", ["address_id"], :name => "index_participants_on_address_id"
  add_index "participants", ["company_id"], :name => "index_participants_on_company_id"
  add_index "participants", ["photo_id"], :name => "index_participants_on_photo_id"

  create_table "payments", :force => true do |t|
    t.integer  "credential_id"
    t.string   "method"
    t.integer  "amount"
    t.integer  "user_id"
    t.string   "observation"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "payments", ["credential_id"], :name => "index_payments_on_credential_id"
  add_index "payments", ["user_id"], :name => "index_payments_on_user_id"

  create_table "payments_rooms", :force => true do |t|
    t.integer "payment_id"
    t.integer "room_id"
  end

  add_index "payments_rooms", ["payment_id"], :name => "index_payments_rooms_on_payment_id"
  add_index "payments_rooms", ["room_id"], :name => "index_payments_rooms_on_room_id"

  create_table "photos", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "rooms", :force => true do |t|
    t.string   "name"
    t.integer  "event_id"
    t.integer  "limit"
    t.integer  "price"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "rooms", ["event_id"], :name => "index_rooms_on_event_id"

  create_table "uploads", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  add_index "uploads", ["user_id"], :name => "index_uploads_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "password"
    t.boolean  "is_admin"
    t.boolean  "is_active"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
  end

end
