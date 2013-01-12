require 'spec_helper'

describe RosterSlotPosition do

  it 'has a valid factory' do
    FactoryGirl.create(:roster_slot_position).should be_valid
  end

  it 'is invalid without a name' do
    FactoryGirl.build(:roster_slot_position, name: nil).should_not be_valid
  end

  it 'is invalid without an abbreviation' do
    FactoryGirl.build(:roster_slot_position, abbreviation: nil).should_not be_valid
  end

  it 'is invalid without a weight' do
    FactoryGirl.build(:roster_slot_position, weight: nil).should_not be_valid
  end

  it { should have_many(:roster_slots) }

end