class GroupDivision < ActiveRecord::Base
  attr_accessible :group_id, :name, :weight

  validates_presence_of :group_id, :name, :weight

  belongs_to :group
end