class Roster < ActiveRecord::Base
  validates_presence_of :name, :abbreviation

  has_many :roster_users
  has_many :users, through: :roster_users

  has_many :group_rosters
  has_many :groups, through: :group_rosters

  has_many :group_divisions

  has_many :roster_slots
  has_many :players, through: :roster_slots

  has_many :group_game_opponents
  has_many :group_games, through: :group_game_opponents

  has_many :roster_stat_periods
  has_many :roster_stat_seasons
  has_one  :roster_stat_career
  
  has_many :group_logs
end