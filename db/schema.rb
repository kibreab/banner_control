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

ActiveRecord::Schema.define(version: 20131112141546) do

  create_table "banner_contents", force: true do |t|
    t.string   "title"
    t.string   "contact"
    t.text     "content"
    t.string   "banner_image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "banner_slots", force: true do |t|
    t.string   "name"
    t.string   "bgimage"
    t.string   "bgcolor"
    t.integer  "width"
    t.integer  "height"
    t.integer  "transparency"
    t.datetime "valid_to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "banners", force: true do |t|
    t.integer  "banner_content_id"
    t.integer  "banner_slot_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
