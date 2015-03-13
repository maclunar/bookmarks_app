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

ActiveRecord::Schema.define(version: 20150313164126) do

  create_table "bookmarks", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "domain_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "shortened_url"
  end

  add_index "bookmarks", ["domain_id"], name: "index_bookmarks_on_domain_id"

  create_table "domains", force: :cascade do |t|
    t.string   "domain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shortened_urls", force: :cascade do |t|
    t.integer  "owner_id"
    t.string   "owner_type", limit: 20
    t.string   "url",                               null: false
    t.string   "unique_key", limit: 10,             null: false
    t.integer  "use_count",             default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shortened_urls", ["owner_id", "owner_type"], name: "index_shortened_urls_on_owner_id_and_owner_type"
  add_index "shortened_urls", ["unique_key"], name: "index_shortened_urls_on_unique_key", unique: true
  add_index "shortened_urls", ["url"], name: "index_shortened_urls_on_url"

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

end
