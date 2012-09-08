class Team < ActiveRecord::Base
  attr_accessible :location_name, :nickname, :abbreviation

  validates_presence_of :location_name, :nickname, :abbreviation

  has_many :players

  def full_name
    "#{location_name} #{nickname}"
  end

end
