# == Schema Information
#
# Table name: season_stats
#
#  id         :integer          not null, primary key
#  player_id  :integer
#  season     :integer
#  pa_att     :integer          default(0)
#  pa_comp    :integer          default(0)
#  pa_td      :integer          default(0)
#  pa_yd      :integer          default(0)
#  pa_int     :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SeasonStat < ActiveRecord::Base
  attr_accessible :player_id, :season
  attr_accessible :pa_att, :pa_comp, :pa_int, :pa_td, :pa_yd

  validates_presence_of :player_id, :season

  belongs_to :player

  def pass_summary
    "#{pa_comp}-#{pa_att}-#{pa_yd} Pass, #{pa_td} PaTD, #{pa_int} PaInt"
  end
end
