require 'spec_helper'

describe GroupDivision do

  it 'has a valid factory' do
    FactoryGirl.create(:group_division).should be_valid
  end

  it 'is invalid without a group division name' do
    FactoryGirl.build(:group_division, name: nil).should_not be_valid
  end

  it 'is invalid without a group division abbreviation' do
    FactoryGirl.build(:group_division, abbreviation: nil).should_not be_valid
  end

  it 'is invalid without a group division weight' do
    FactoryGirl.build(:group_division, weight: nil).should_not be_valid
  end

  it { should belong_to(:group) }

end