class Roster < ActiveRecord::Base
  attr_accessible :abbreviation, :name

  validates_presence_of :name, :abbreviation

  has_many :roster_users
  has_many :users, :through => :roster_users

  has_many :group_rosters
  has_many :groups, :through => :group_rosters
end
