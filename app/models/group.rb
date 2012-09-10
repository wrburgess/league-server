class Group < ActiveRecord::Base
  attr_accessible :name

  validates_presence_of :name

  has_many :managers, :through => :group_managers
  has_many :rosters, :through => :group_rosters
end
