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

ActiveRecord::Schema.define(version: 20150426194923) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "boundaries", force: true do |t|
    t.integer  "boundable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.spatial  "boundary",       limit: {:srid=>4326, :type=>"polygon"},                  null: false
    t.spatial  "location",       limit: {:srid=>4326, :type=>"point"}
    t.string   "boundable_type",                                         default: "City", null: false
  end

  add_index "boundaries", ["boundable_id"], :name => "index_boundaries_on_boundable_id"
  add_index "boundaries", ["boundary"], :name => "index_boundaries_on_boundary", :spatial => true

  create_table "cities", force: true do |t|
    t.string  "name",                                           default: "", null: false
    t.string  "string",                                         default: "", null: false
    t.text    "viewport"
    t.spatial "location", limit: {:srid=>4326, :type=>"point"}
    t.spatial "point",    limit: {:srid=>4326, :type=>"point"}
  end

  create_table "locales", force: true do |t|
    t.string  "name",                                           default: "", null: false
    t.integer "city_id"
    t.spatial "location", limit: {:srid=>4326, :type=>"point"}
  end

end
