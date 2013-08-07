class PlayerStatGame < ActiveRecord::Base
  validates_presence_of :player_id, :game_date, :period, :season

  belongs_to :player
  belongs_to :opponent, :class_name => "Team", :foreign_key => "opponent_id"

  def pass_summary
    "#{pa_comp}-#{pa_att}-#{pa_yd} Pass, #{pa_td} PaTD, #{pa_int} PaInt"
  end

end
