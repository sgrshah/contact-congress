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

ActiveRecord::Schema.define(version: 20130929014227) do

  create_table "congressman_letters", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "congressman_id"
    t.integer  "letter_id"
  end

  create_table "congressmen", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "district"
    t.string   "chamber"
  end

  create_table "issues", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "letter_issues", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "letter_id"
    t.integer  "issue_id"
  end

  create_table "letters", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "author"
    t.text     "content"
    t.integer  "congressman_id"
    t.string   "zip_code"
  end

end
