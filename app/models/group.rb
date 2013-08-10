class Group < ActiveRecord::Base

  validates_presence_of :name, :abbreviation

  has_many :group_users
  has_many :users, :through => :group_users

  has_many :group_rosters
  has_many :rosters, :through => :group_rosters

  has_many :group_divisions

  has_many :group_player_teams
  has_many :player_teams, :through => :group_player_teams
  has_many :players, :through => :player_teams

  has_many :group_games
  has_many :group_rules
  has_many :group_logs

  def add_rosters(rosters)
    rosters.each do |roster|
      group_division = self.default_group_division
      group_rosters.create(roster: roster, group_division: group_division) 
    end
  end

  def default_group_division
    unless group_divisions.any? 
      return group_divisions.create(name: "Default", abbreviation: "DFLT", weight: 0, default: true)
    else
      return group_divisions.default_first
    end
  end

end
