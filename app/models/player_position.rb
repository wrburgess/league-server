class PlayerPosition < ActiveRecord::Base
  attr_accessible :name, :abbreviation, :weight

  validates_presence_of :name, :abbreviation, :weight

  has_many :players
end