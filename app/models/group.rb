class Group < ActiveRecord::Base

  validates_presence_of :name, :abbreviation

  has_many :group_users
  has_many :users, :through => :group_users

  has_many :group_rosters
  has_many :rosters, :through => :group_rosters

  has_many :group_player_teams
  has_many :player_teams, :through => :group_player_teams
  has_many :players, :through => :player_teams

  has_many :group_rules
  has_many :group_logs

end
