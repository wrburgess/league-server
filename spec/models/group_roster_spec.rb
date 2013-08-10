require 'spec_helper'

describe GroupRoster do

  it 'has a valid factory' do
    FactoryGirl.create(:group_roster).should be_valid
  end

  it 'is invalid without a group' do
    FactoryGirl.build(:group_roster, group: nil).should_not be_valid
  end

  it 'is invalid without a roster' do
    FactoryGirl.build(:group_roster, roster: nil).should_not be_valid
  end

  it 'is invalid without a group division' do
    FactoryGirl.build(:group_roster, group_division: nil).should_not be_valid
  end

  it { should belong_to(:group) }
  it { should belong_to(:group_division) }

end