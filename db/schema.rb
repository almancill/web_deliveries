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

ActiveRecord::Schema.define(:version => 7) do

  create_table "addresses", :force => true do |t|
    t.integer  "customer_id", :null => false
    t.string   "value",       :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "addresses", ["customer_id"], :name => "index_addresses_on_customer_id"

  create_table "amounts", :force => true do |t|
    t.decimal  "money_amount",  :null => false
    t.text     "description"
    t.integer  "motorcycle_id", :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "amounts", ["motorcycle_id"], :name => "index_amounts_on_motorcycle_id"

  create_table "customers", :force => true do |t|
    t.string   "name",         :null => false
    t.string   "escaped_name", :null => false
    t.string   "email"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "deliveries", :force => true do |t|
    t.integer  "address_id",     :null => false
    t.text     "description",    :null => false
    t.text     "note"
    t.integer  "motorcycle_id",  :null => false
    t.decimal  "delivery_cost",  :null => false
    t.decimal  "invoice_cost"
    t.integer  "invoice_number"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "deliveries", ["address_id"], :name => "index_deliveries_on_address_id"

  create_table "motorcycles", :force => true do |t|
    t.string   "name",           :null => false
    t.string   "messenger_name", :null => false
    t.text     "description"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "telephones", :force => true do |t|
    t.integer  "customer_id", :null => false
    t.integer  "number",      :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "telephones", ["customer_id"], :name => "index_telephones_on_customer_id"

  create_table "users", :force => true do |t|
    t.string   "name",                                :null => false
    t.string   "username",                            :null => false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.boolean  "admin",            :default => false, :null => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

end
