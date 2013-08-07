require 'spec_helper'

describe GroupGame do

  it 'has a valid factory' do
    FactoryGirl.create(:group_game).should be_valid
  end

  it 'is invalid without a season' do
    FactoryGirl.build(:group_game, season: nil).should_not be_valid
  end

  it 'is invalid without a period' do
    FactoryGirl.build(:group_game, period: nil).should_not be_valid
  end

  it 'is invalid without a counts flag' do
    FactoryGirl.build(:group_game, counts: nil).should_not be_valid
  end

  it 'is invalid without a group' do
    FactoryGirl.build(:group_game, group: nil).should_not be_valid
  end

  it 'is invalid without an away team' do
    FactoryGirl.build(:group_game, away_team: nil).should_not be_valid
  end

  it 'is invalid without a home team' do
    FactoryGirl.build(:group_game, home_team: nil).should_not be_valid
  end

  it { should belong_to(:group) }

end