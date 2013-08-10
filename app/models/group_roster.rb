class GroupRoster < ActiveRecord::Base
  validates_presence_of :group, :roster, :group_division

  belongs_to :group
  belongs_to :roster
  belongs_to :group_division
end