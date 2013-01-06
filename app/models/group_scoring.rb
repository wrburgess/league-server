class GroupScoring < ActiveRecord::Base
  attr_accessible :group_id, :season

  validates_presence_of :group_id, :season

  belongs_to :group
end