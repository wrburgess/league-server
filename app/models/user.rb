class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :remember_me

  # Include default devise modules :confirmable, :timeoutable
  devise :database_authenticatable, :lockable, :omniauthable, :registerable,
         :recoverable, :rememberable, :token_authenticatable, :trackable, :validatable

  has_many :group_users
  has_many :groups, :through => :group_users

  has_many :roster_users
  has_many :rosters, :through => :roster_users

end
