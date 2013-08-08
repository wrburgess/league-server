class GroupGame < ActiveRecord::Base
  validates_presence_of :group_id, :season, :period
  validates_presence_of :regular, :playoff, :final

  belongs_to :group
  has_many :group_game_opponents
  has_many :rosters, through: :group_game_opponents
end
