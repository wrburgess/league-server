class RosterStatSeason < ActiveRecord::Base
  validates_presence_of :roster_id, :season

  belongs_to :roster
end