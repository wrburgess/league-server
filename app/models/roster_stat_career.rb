class RosterStatCareer < ActiveRecord::Base
  validates_presence_of :roster_id

  belongs_to :roster
end