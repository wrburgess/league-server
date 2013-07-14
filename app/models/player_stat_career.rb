class PlayerStatCareer < ActiveRecord::Base
  # attr_accessible :player_id
  # attr_accessible :pa_att, :pa_comp, :pa_int, :pa_td, :pa_yd

  validates_presence_of :player_id

  belongs_to :player

  def pass_summary
    "#{pa_comp}-#{pa_att}-#{pa_yd} Pass, #{pa_td} PaTD, #{pa_int} PaInt"
  end
end
