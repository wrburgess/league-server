require 'spec_helper'

describe RosterSlot do

  it 'has a valid factory' do
    FactoryGirl.create(:roster_slot).should be_valid
  end

  it 'is invalid without a roster' do
    FactoryGirl.build(:roster_slot, roster_id: nil).should_not be_valid
  end

  it 'is invalid without a player' do
    FactoryGirl.build(:roster_slot, player_id: nil).should_not be_valid
  end

  it 'is invalid without a roster_slot_type' do
    FactoryGirl.build(:roster_slot, roster_slot_type_id: nil).should_not be_valid
  end

  it 'is invalid without a roster_slot_position' do
    FactoryGirl.build(:roster_slot, roster_slot_position_id: nil).should_not be_valid
  end

  it { should belong_to(:roster) }
  it { should belong_to(:player) }
  it { should belong_to(:roster_slot_type) }
  it { should belong_to(:roster_slot_position) }

end