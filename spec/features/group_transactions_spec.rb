require 'spec_helper'

describe "Group Games View" do
  let!(:group) { FactoryGirl.create :group }
  let(:roster1) { FactoryGirl.create :roster, name: "Illinois Towers" }
  let(:roster2) { FactoryGirl.create :roster, name: "St. Simons Avians" }
  let(:roster3) { FactoryGirl.create :roster, name: "Orlando Thunder" }
  let(:roster4) { FactoryGirl.create :roster, name: "Fairfax Pitbulls" }
  let(:roster5) { FactoryGirl.create :roster, name: "Des Moines Panthers" }
  let(:roster6) { FactoryGirl.create :roster, name: "Golden Isles PhishHeads" }
  let(:roster7) { FactoryGirl.create :roster, name: "Norfolk Dogs" }
  let(:roster8) { FactoryGirl.create :roster, name: "Northern Virginia River Rats" }

  let!(:group_log1) { FactoryGirl.create :group_log, group: group, roster: roster1 }
  let!(:group_log2) { FactoryGirl.create :group_log, group: group, roster: roster4 }
  let!(:group_log3) { FactoryGirl.create :group_log, group: group, roster: roster6 }
  let!(:group_log4) { FactoryGirl.create :group_log, group: group, roster: roster8, group_owner: true }

  describe "#games" do
    it "has the correct default elements", :slow do
      visit group_transactions_path(group)
      page.should have_css("body.games")
      page.should have_css("h1", :text => "Games")
    end

    it "redirects to first team group_roster show view", :slow do
      visit group_transactions_path(group, roster3)
      find("tr.row-#{group_log1.id} td.team-name a").click
      expect(current_path).to eq group_roster_path group, group_log1.roster
    end

    it "inserts a commish flag for commish-executed group logs", :slow do
      visit group_transactions_path(group, roster3)
      page.should have_css("tr.row-#{group_log4.id}.commish-action")
    end

    it "redirects to player show view", :slow do
      visit group_transactions_path(group, roster6)
      find("tr.row-#{group_log2.id} td.player-name a").click
      expect(current_path).to eq group_player_path group, group_log2.player
    end
  end
end