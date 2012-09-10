class Group < ActiveRecord::Base
  attr_accessible :name

  validates_presence_of :name

  has_many :group_users
  has_many :users, :through => :group_users
end
