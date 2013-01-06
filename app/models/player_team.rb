class PlayerTeam < ActiveRecord::Base
  attr_accessible :location_name, :nickname, :abbreviation

  validates_presence_of :location_name, :nickname, :abbreviation

  has_many :players

  has_many :group_player_teams
  has_many :groups, :through => :group_player_teams

  def full_name
    "#{location_name} #{nickname}"
  end
end
