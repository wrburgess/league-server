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

require 'spec_helper'

describe SeasonStat do

  it 'has a valid factory' do
    FactoryGirl.create(:season_stat).should be_valid
  end

  it 'is invalid without a player' do
    FactoryGirl.build(:season_stat, player_id: nil).should_not be_valid
  end

  it 'is invalid without a season' do
    FactoryGirl.build(:season_stat, season: nil).should_not be_valid
  end

  it { should belong_to(:player) }

  describe '#pass_summary' do

    it 'sets passing summary from passing stats' do
      FactoryGirl.create(:career_stat).pass_summary.should == '1-2-3 Pass, 4 PaTD, 5 PaInt'
    end

  end

end
