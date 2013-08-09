require 'spec_helper'

describe Roster  do

  it 'has a valid factory' do
    FactoryGirl.create(:roster).should be_valid
  end

  it 'is invalid without a roster name' do
    FactoryGirl.build(:roster, name: nil).should_not be_valid
  end

  it { should have_many(:roster_users) }
  it { should have_many(:users) }

  it { should have_many(:group_rosters) }
  it { should have_many(:groups) }

  it { should have_many(:roster_slots) }
  it { should have_many(:players) }

  it { should have_many(:group_game_opponents) }
  it { should have_many(:group_games) }

  it { should have_many(:roster_stat_periods) }
  it { should have_many(:roster_stat_seasons) }
  it { should have_one(:roster_stat_career) }

  it { should have_many(:group_logs) }
  
end
