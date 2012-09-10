require 'spec_helper'

describe Group do

  it 'has a valid factory' do
    FactoryGirl.create(:group).should be_valid
  end

  it 'is invalid without a group name' do
    FactoryGirl.build(:group, name: nil).should_not be_valid
  end

  it { should have_many(:group_users) }
  it { should have_many(:users) }

end

