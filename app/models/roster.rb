class Roster < ActiveRecord::Base
  attr_accessible :abbreviation, :name

  validates_presence_of :name

  has_many :roster_users
  has_many :users, :through => :roster_users
end
