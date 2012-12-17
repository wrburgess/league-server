class Group < ActiveRecord::Base
  attr_accessible :name, :abbreviation

  validates_presence_of :name, :abbreviation

  has_many :group_users
  has_many :users, :through => :group_users

  has_many :group_rosters
  has_many :rosters, :through => :group_rosters

  def send_weekly_review(user)
    GroupMailer.weekly_review(user).deliver
  end

end
