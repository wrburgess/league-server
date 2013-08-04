require 'spec_helper'

describe GroupLog do

  it 'has a valid factory' do
    FactoryGirl.create(:group_log).should be_valid
  end

  it 'is invalid without a group' do
    FactoryGirl.build(:group_log, group_id: nil).should_not be_valid
  end

  it 'is invalid without a roster' do
    FactoryGirl.build(:group_log, roster_id: nil).should_not be_valid
  end

  it 'is invalid without a group_log action' do
    FactoryGirl.build(:group_log, action: nil).should_not be_valid
  end

  it { should belong_to(:group) }
  it { should belong_to(:roster) }
  it { should belong_to(:player) }

end