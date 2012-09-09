require 'spec_helper'

describe CareerStat do

  it 'has a valid factory' do
    FactoryGirl.create(:career_stat).should be_valid
  end

  it 'is invalid without a player' do
    FactoryGirl.build(:career_stat, player_id: nil).should_not be_valid
  end

  it { should belong_to(:player) }

  describe '#pass_summary' do

    it 'sets passing summary from passing stats' do
      FactoryGirl.create(:career_stat).pass_summary.should == '1-2-3 Pass, 4 PaTD, 5 PaInt'
    end

  end

end
