# == Schema Information
#
# Table name: game_stats
#
#  id          :integer          not null, primary key
#  player_id   :integer
#  opponent_id :integer
#  game_date   :date
#  season      :integer
#  pa_att      :integer          default(0)
#  pa_comp     :integer          default(0)
#  pa_td       :integer          default(0)
#  pa_yd       :integer          default(0)
#  pa_int      :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  week        :integer
#

require 'spec_helper'

describe GameStat do

  it 'has a valid factory' do
    FactoryGirl.create(:game_stat).should be_valid
  end

  it 'is invalid without a player' do
    FactoryGirl.build(:game_stat, player_id: nil).should_not be_valid
  end

  it 'is invalid without a week' do
    FactoryGirl.build(:game_stat, week: nil).should_not be_valid
  end

  it 'is invalid without a season' do
    FactoryGirl.build(:game_stat, season: nil).should_not be_valid
  end

  it 'is invalid without a game_date' do
    FactoryGirl.build(:game_stat, game_date: nil).should_not be_valid
  end

  it { should belong_to(:player) }
  it { should belong_to(:opponent) }

  describe '#pass_summary' do

    it 'sets passing summary from passing stats' do
      FactoryGirl.create(:game_stat).pass_summary.should == '1-2-3 Pass, 4 PaTD, 5 PaInt'
    end

  end

end
