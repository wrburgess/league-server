require 'spec_helper'

describe PlayerStatSeason do

  it 'has a valid factory' do
    FactoryGirl.create(:player_stat_season).should be_valid
  end

  it 'is invalid without a player' do
    FactoryGirl.build(:player_stat_season, player_id: nil).should_not be_valid
  end

  it 'is invalid without a season' do
    FactoryGirl.build(:player_stat_season, season: nil).should_not be_valid
  end

  it { should belong_to(:player) }

  describe '#pass_summary' do

    it 'sets passing summary from passing stats' do
      FactoryGirl.create(:player_stat_career).pass_summary.should == '1-2-3 Pass, 4 PaTD, 5 PaInt'
    end

  end

end
