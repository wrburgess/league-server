require 'spec_helper'

describe RosterStatPeriod do

  it 'has a valid factory' do
    FactoryGirl.create(:roster_stat_period).should be_valid
  end

  it 'is invalid without a roster' do
    FactoryGirl.build(:roster_stat_period, roster: nil).should_not be_valid
  end

  it 'is invalid without a season' do
    FactoryGirl.build(:roster_stat_period, season: nil).should_not be_valid
  end

  it 'is invalid without a period' do
    FactoryGirl.build(:roster_stat_period, period: nil).should_not be_valid
  end

  it { should belong_to(:roster) }

end