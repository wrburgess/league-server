require 'spec_helper'

describe GroupGame do

  it "has a valid factory" do
    FactoryGirl.create(:group_game).should be_valid
  end

  it "is invalid without a season" do
    FactoryGirl.build(:group_game, season: nil).should_not be_valid
  end

  it "is invalid without a period" do
    FactoryGirl.build(:group_game, period: nil).should_not be_valid
  end

  it "is invalid without a group" do
    FactoryGirl.build(:group_game, group: nil).should_not be_valid
  end

  it "is invalid without a game_type" do
    FactoryGirl.build(:group_game, game_type: nil).should_not be_valid
  end

  it { should belong_to(:group) }

  describe "types" do
    it "returns game types defined in AppSettings" do
      expect(GroupGame.types).to eq AppSettings.app_game_types
    end
  end

end