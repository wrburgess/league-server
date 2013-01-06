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

ActiveRecord::Schema.define(:version => 20121215111111) do

  create_table "api_logs", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "group_divisions", :force => true do |t|
    t.integer  "group_id"
    t.string   "name"
    t.integer  "weight"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "group_log", :force => true do |t|
    t.integer  "transaction_id"
    t.integer  "group_id"
    t.integer  "roster_id"
    t.integer  "player_id"
    t.string   "action"
    t.boolean  "group_owner"
    t.string   "note"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "group_rosters", :force => true do |t|
    t.integer  "group_id"
    t.integer  "roster_id"
    t.integer  "group_division_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "group_rules", :force => true do |t|
    t.integer  "group_id"
    t.integer  "season"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "group_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.boolean  "founder",    :default => false
    t.boolean  "owner",      :default => false
    t.boolean  "viewer",     :default => true
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name",         :null => false
    t.string   "abbreviation", :null => false
    t.integer  "divisions"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "player_stat_careers", :force => true do |t|
    t.integer  "player_id"
    t.integer  "pa_att",     :default => 0
    t.integer  "pa_comp",    :default => 0
    t.integer  "pa_td",      :default => 0
    t.integer  "pa_yd",      :default => 0
    t.integer  "pa_int",     :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "player_stat_games", :force => true do |t|
    t.integer  "player_id"
    t.integer  "season"
    t.integer  "week"
    t.date     "game_date"
    t.integer  "opponent_id"
    t.integer  "pa_att",      :default => 0
    t.integer  "pa_comp",     :default => 0
    t.integer  "pa_td",       :default => 0
    t.integer  "pa_yd",       :default => 0
    t.integer  "pa_int",      :default => 0
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "player_stat_seasons", :force => true do |t|
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

  create_table "player_teams", :force => true do |t|
    t.string   "location_name"
    t.string   "nickname"
    t.string   "abbreviation",  :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "players", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "player_team_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "roster_stat_careers", :force => true do |t|
    t.integer  "roster_id"
    t.integer  "wins"
    t.integer  "losses"
    t.integer  "ties"
    t.integer  "points_for"
    t.integer  "points_against"
    t.integer  "champ_wins"
    t.integer  "champ_losses"
    t.integer  "champ_ties"
    t.integer  "playoff_wins"
    t.integer  "playoff_losses"
    t.integer  "playoff_ties"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "roster_stat_games", :force => true do |t|
    t.integer  "roster_id"
    t.integer  "season",         :null => false
    t.integer  "week",           :null => false
    t.integer  "win"
    t.integer  "loss"
    t.integer  "tie"
    t.integer  "points_for"
    t.integer  "points_against"
    t.integer  "champ_win"
    t.integer  "champ_loss"
    t.integer  "champ_tie"
    t.integer  "playoff_win"
    t.integer  "playoff_losse"
    t.integer  "playoff_tie"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "roster_stat_seasons", :force => true do |t|
    t.integer  "roster_id"
    t.integer  "season",         :null => false
    t.integer  "wins"
    t.integer  "losses"
    t.integer  "ties"
    t.integer  "points_for"
    t.integer  "points_against"
    t.integer  "champ_wins"
    t.integer  "champ_losses"
    t.integer  "champ_ties"
    t.integer  "playoff_wins"
    t.integer  "playoff_losses"
    t.integer  "playoff_ties"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "roster_users", :force => true do |t|
    t.integer  "roster_id"
    t.integer  "user_id"
    t.boolean  "founder",    :default => false
    t.boolean  "owner",      :default => true
    t.boolean  "viewer",     :default => true
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "rosters", :force => true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
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
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
