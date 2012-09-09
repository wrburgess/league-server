class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :remember_me

  # Include default devise modules :confirmable, :timeoutable
  devise :database_authenticatable, :lockable, :omniauthable, :registerable,
         :recoverable, :rememberable, :token_authenticatable, :trackable, :validatable

end
