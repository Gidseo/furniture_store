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

ActiveRecord::Schema.define(:version => 20130214090633) do

  create_table "furnishings", :force => true do |t|
    t.string   "img"
    t.text     "dimensions_description"
    t.string   "name"
    t.text     "description"
    t.string   "alter"
    t.string   "shape"
    t.float    "seats"
    t.boolean  "is_main",                :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "visitors", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "telephone"
    t.string   "postcode"
    t.string   "heard_from"
    t.text     "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
