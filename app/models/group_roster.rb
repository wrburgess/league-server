class GroupRoster < ActiveRecord::Base
  attr_accessible :group_id, :roster_id, :group_division_id

  # validates_presence_of :group_division_id

  belongs_to :group
  belongs_to :roster
end