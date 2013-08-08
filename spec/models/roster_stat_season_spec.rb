require 'spec_helper'

describe RosterStatSeason do

  it 'has a valid factory' do
    FactoryGirl.create(:roster_stat_season).should be_valid
  end

  it 'is invalid without a roster' do
    FactoryGirl.build(:roster_stat_season, roster: nil).should_not be_valid
  end

  it 'is invalid without a season' do
    FactoryGirl.build(:roster_stat_season, season: nil).should_not be_valid
  end

  it { should belong_to(:roster) }

end
