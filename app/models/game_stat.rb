class GameStat < ActiveRecord::Base
  attr_accessible :game_date, :opponent_id, :player_id, :season, :week
  attr_accessible :pa_att, :pa_comp, :pa_int, :pa_td, :pa_yd

  validates_presence_of :player_id, :game_date, :week, :season
end
