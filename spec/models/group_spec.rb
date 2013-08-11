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

  describe "#add_rosters" do
    it "adds rosters to a group with a default group_division" do
      group = FactoryGirl.create :group
      roster = FactoryGirl.create :roster
      group.add_rosters [roster]
      expect(roster.group_divisions.where(group: group).first).to eq(group.default_group_division)
    end

    it "adds rosters to a group with a non-default group_division" do
      group = FactoryGirl.create :group
      roster = FactoryGirl.create :roster
      group_division2 = FactoryGirl.create :group_division, group: group
      group.add_rosters [roster], group_division2
      expect(roster.group_divisions.where(group: group).first).to eq(group_division2)
    end
  end

  describe "#default_group_division" do
    let(:group) { FactoryGirl.create :group }

    it "retrieves the default group division even if none exists" do
      expect(group.group_divisions.count).to eq(0)
      group_division_default = group.default_group_division
      expect(group.group_divisions.count).to eq(1)
    end

    it "retrieves the default group division that already exists" do
      group_division_default = FactoryGirl.create :group_division, group: group, name: "Default", abbreviation: "MAIN", weight: 0, default: true
      expect(group.default_group_division).to eq(group_division_default)
    end

    it "retrieves the default group division when multiple group divisions exist" do
      group_division_default = FactoryGirl.create :group_division, group: group, name: "Default", abbreviation: "MAIN", weight: 0, default: true
      group_division_2 = FactoryGirl.create :group_division, group: group, name: "Eastern", abbreviation: "EAST", weight: 1     
      expect(group.default_group_division).to eq(group_division_default)
    end
  end
end

