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

ActiveRecord::Schema.define(:version => 20120909212555) do

  create_table "career_stats", :force => true do |t|
    t.integer  "player_id"
    t.integer  "pa_att",     :default => 0
    t.integer  "pa_comp",    :default => 0
    t.integer  "pa_td",      :default => 0
    t.integer  "pa_yd",      :default => 0
    t.integer  "pa_int",     :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "game_stats", :force => true do |t|
    t.integer  "player_id"
    t.integer  "opponent_id"
    t.date     "game_date"
    t.integer  "season"
    t.integer  "pa_att",      :default => 0
    t.integer  "pa_comp",     :default => 0
    t.integer  "pa_td",       :default => 0
    t.integer  "pa_yd",       :default => 0
    t.integer  "pa_int",      :default => 0
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "week"
  end

  create_table "players", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "team_id"
  end

  create_table "season_stats", :force => true do |t|
    t.integer  "player_id"
    t.integer  "season"
    t.integer  "pa_att",     :default => 0
    t.integer  "pa_comp",    :default => 0
    t.integer  "pa_td",      :default => 0
    t.integer  "pa_yd",      :default => 0
    t.integer  "pa_int",     :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "teams", :force => true do |t|
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "location_name"
    t.string   "nickname"
    t.string   "abbreviation"
  end

end
