class PlayerConference < ActiveRecord::Base
  attr_accessible :name, :abbreviation

  validates_presence_of :name, :abbreviation

  has_many :player_teams
  has_many :players, :through => :player_teams

  def full_name
    "#{name} Conference (#{abbreviation})"
  end
end