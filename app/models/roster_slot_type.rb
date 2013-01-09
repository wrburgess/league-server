class RosterSlotType < ActiveRecord::Base
  attr_accessible :name, :abbreviation

  validates_presence_of :name, :abbreviation, :player_id, :roster_id, :roster_slot_type_id

  belongs_to :roster_slot
end