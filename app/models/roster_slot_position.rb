class RosterSlotPosition < ActiveRecord::Base
  attr_accessible :name, :abbreviation

  validates_presence_of :name, :abbreviation

  has_many :roster_slots
end