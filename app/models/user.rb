class User < ActiveRecord::Base
  devise :database_authenticatable, :lockable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :group_users
  has_many :groups, :through => :group_users

  has_many :roster_users
  has_many :rosters, :through => :roster_users
end
