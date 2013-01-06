require 'spec_helper'

describe GroupRule do

  it 'has a valid factory' do
    FactoryGirl.create(:group_rule).should be_valid
  end

  it 'is invalid without a group season' do
    FactoryGirl.build(:group_rule, season: nil).should_not be_valid
  end

  it { should belong_to(:group) }

end