class Group < ActiveRecord::Base
  attr_accessible :name

  validates_presence_of :name, :abbreviation

  has_many :group_users
  has_many :users, :through => :group_users

  def send_weekly_review(user)
    GroupMailer.weekly_review(user).deliver
  end

end
