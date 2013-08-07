class CreateModels < ActiveRecord::Migration

  def change

    create_table "api_logs", force: true do |t|
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "players", force: true do |t|
      t.string   "first_name", null: false
      t.string   "last_name", null: false
      t.integer  "player_team_id", null: false
      t.integer  "player_position_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "player_positions", force: true do |t|
      t.string   "name", null: false
      t.string   "abbreviation", null: false
      t.integer  "weight", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "player_teams", force: true do |t|
      t.string   "location_name"
      t.string   "nickname"
      t.string   "abbreviation",  null: false
      t.integer  "player_conference_id", null: false
      t.datetime "created_at",    null: false
      t.datetime "updated_at",    null: false
    end

    create_table "player_conferences", force: true do |t|
      t.string   "name",          null: false
      t.string   "abbreviation",  null: false
      t.datetime "created_at",    null: false
      t.datetime "updated_at",    null: false
    end

    create_table "player_stat_games", force: true do |t|
      t.integer  "player_id",   null: false
      t.integer  "season",      null: false
      t.integer  "period",        null: false
      t.date     "game_date"
      t.integer  "opponent_id"
      t.integer  "pa_att",      default: 0
      t.integer  "pa_comp",     default: 0
      t.integer  "pa_td",       default: 0
      t.integer  "pa_yd",       default: 0
      t.integer  "pa_int",      default: 0
      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
    end

    create_table "player_stat_seasons", force: true do |t|
      t.integer  "player_id",  null: false
      t.integer  "season",     null: false
      t.integer  "pa_att",     default: 0
      t.integer  "pa_comp",    default: 0
      t.integer  "pa_td",      default: 0
      t.integer  "pa_yd",      default: 0
      t.integer  "pa_int",     default: 0
      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
    end

    create_table "player_stat_careers", force: true do |t|
      t.integer  "player_id",  null: false
      t.integer  "pa_att",     default: 0
      t.integer  "pa_comp",    default: 0
      t.integer  "pa_td",      default: 0
      t.integer  "pa_yd",      default: 0
      t.integer  "pa_int",     default: 0
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "groups", force: true do |t|
      t.string   "name",          null: false
      t.string   "abbreviation",  null: false
      t.integer  "divisions"
      t.datetime "created_at",    null: false
      t.datetime "updated_at",    null: false
    end

    create_table "group_rosters", force: true do |t|
      t.integer  "group_id"
      t.integer  "roster_id"
      t.integer  "group_division_id"
      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
    end

    create_table "group_divisions", force: true do |t|
      t.integer  "group_id"
      t.string   "name"
      t.integer  "weight"
      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
    end

    create_table "group_games", force: true do |f|
      t.integer  "group_id"
      t.integer  "season"
      t.integer  "period"
      t.boolean  "counts", default: false
      t.integer  "away_roster_id" 
      t.integer  "away_roster_score", default: 0
      t.integer  "away_roster_score_adjustment", default: 0
      t.integer  "home_roster_id"
      t.integer  "home_roster_score", default: 0
      t.integer  "home_roster_score_adjustment", default: 0
      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
    end

    create_table "group_logs", force: true do |t|
      t.integer  "group_id",    null: false
      t.integer  "roster_id",   null: false
      t.integer  "player_id"
      t.string   "action",      null: false
      t.boolean  "group_owner"
      t.string   "note"
      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
    end

    create_table "group_rules", force: true do |t|
      t.integer  "group_id"
      t.integer  "season"
      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
    end

    create_table "group_users", force: true do |t|
      t.integer  "user_id"
      t.integer  "group_id"
      t.boolean  "founder",     default: false
      t.boolean  "owner",       default: false
      t.boolean  "viewer",      default: true
      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
    end

    create_table "group_player_teams", force: true do |t|
      t.integer  "group_id",  null: false
      t.integer  "player_team_id",  null: false
      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
    end

    create_table "rosters", force: true do |t|
      t.string   "name"
      t.string   "abbreviation"
      t.datetime "created_at",   null: false
      t.datetime "updated_at",   null: false
    end

    create_table "roster_slots", force: true do |t|
      t.integer  "season",                  null: false
      t.integer  "period",                  null: false
      t.integer  "roster_id",               null: false
      t.integer  "player_id",               null: false
      t.integer  "roster_slot_type_id",     null: false
      t.integer  "roster_slot_position_id", null: false
      t.datetime "created_at",              null: false
      t.datetime "updated_at",              null: false
    end

    create_table "roster_slot_types", force: true do |t|
      t.integer  "name",         null: false
      t.integer  "abbreviation", null: false
      t.integer  "weight",       null: false
      t.datetime "created_at",   null: false
      t.datetime "updated_at",   null: false
    end

    create_table "roster_slot_positions", force: true do |t|
      t.integer  "name",         null: false
      t.integer  "abbreviation", null: false
      t.integer  "weight",       null: false
      t.datetime "created_at",   null: false
      t.datetime "updated_at",   null: false
    end

    create_table "roster_stat_games", force: true do |t|
      t.integer  "roster_id"
      t.integer  "season",      null: false
      t.integer  "period",      null: false
      t.integer  "win",        default: 0
      t.integer  "loss",        default: 0
      t.integer  "tie",        default: 0
      t.integer  "div_win",        default: 0
      t.integer  "div_loss",        default: 0
      t.integer  "div_tie",        default: 0
      t.integer  "points_for",        default: 0
      t.integer  "points_against",        default: 0
      t.integer  "champ_win",        default: 0
      t.integer  "champ_loss",        default: 0
      t.integer  "champ_tie",        default: 0
      t.integer  "playoff_win",        default: 0
      t.integer  "playoff_losses",        default: 0
      t.integer  "playoff_tie",        default: 0
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "roster_stat_seasons", force: true do |t|
      t.integer  "roster_id"
      t.integer  "season",      null: false
      t.integer  "wins",        default: 0
      t.integer  "losses",        default: 0
      t.integer  "ties",        default: 0
      t.integer  "div_wins",        default: 0
      t.integer  "div_losses",        default: 0
      t.integer  "div_ties",        default: 0
      t.integer  "points_for",        default: 0
      t.integer  "points_against",        default: 0
      t.integer  "champ_wins",        default: 0
      t.integer  "champ_losses",        default: 0
      t.integer  "champ_ties",        default: 0
      t.integer  "playoff_wins",        default: 0
      t.integer  "playoff_losses",        default: 0
      t.integer  "playoff_ties",        default: 0
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "roster_stat_careers", force: true do |t|
      t.integer  "roster_id",        default: 0
      t.integer  "wins",             default: 0
      t.integer  "losses",           default: 0
      t.integer  "ties",             default: 0
      t.integer  "div_wins",        default: 0
      t.integer  "div_losses",        default: 0
      t.integer  "div_ties",        default: 0
      t.integer  "points_for",       default: 0
      t.integer  "points_against",   default: 0
      t.integer  "champ_wins",       default: 0
      t.integer  "champ_losses",     default: 0
      t.integer  "champ_ties",       default: 0
      t.integer  "playoff_wins",     default: 0
      t.integer  "playoff_losses",   default: 0
      t.integer  "playoff_ties",     default: 0
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "roster_users", force: true do |t|
      t.integer  "roster_id"
      t.integer  "user_id"
      t.boolean  "founder",    default: false
      t.boolean  "owner",      default: true
      t.boolean  "viewer",     default: true
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "users", force: true do |t|
      t.string   "email",                  default: "", null: false
      t.string   "encrypted_password",     default: "", null: false
      t.string   "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.integer  "sign_in_count",          default: 0
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.string   "current_sign_in_ip"
      t.string   "last_sign_in_ip"
      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
    end

    add_index "users", ["email"], name: "index_users_on_email", unique: true
    add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  end

end