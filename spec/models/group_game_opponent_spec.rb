require 'spec_helper'

describe GroupGameOpponent do

  it 'has a valid factory' do
    FactoryGirl.create(:group_game_opponent).should be_valid
  end

  it 'is invalid without a group_game' do
    FactoryGirl.build(:group_game_opponent, group_game: nil).should_not be_valid
  end

  it 'is invalid without a roster' do
    FactoryGirl.build(:group_game_opponent, roster: nil).should_not be_valid
  end

  it 'is invalid without a home_roster flag' do
    FactoryGirl.build(:group_game_opponent, home_roster: nil).should_not be_valid
  end

  it { should belong_to(:group_game) }
  it { should belong_to(:roster) }

end