class GroupGame < ActiveRecord::Base
  validates_presence_of :group_id, :season, :period, :game_type

  belongs_to :group
  has_many :group_game_opponents
  has_many :rosters, through: :group_game_opponents

  def self.types
    AppSettings.app_game_types 
  end
end
