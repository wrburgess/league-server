require 'spec_helper'

describe PlayerStatGame do

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
