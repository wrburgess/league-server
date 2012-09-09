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
