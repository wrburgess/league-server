require 'spec_helper'

describe RosterSlot do

  it 'has a valid factory' do
    FactoryGirl.create(:roster_slot).should be_valid
  end

  it 'is invalid without a roster_id' do
    FactoryGirl.build(:roster_slot, roster_id: nil).should_not be_valid
  end

  it { should belong_to(:roster) }
  it { should belong_to(:player) }

end