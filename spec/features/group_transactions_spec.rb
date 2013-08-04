require 'spec_helper'

describe "Group Transactions Page" do
  let!(:group) { FactoryGirl.create :group }
  # let!(:player1) { FactoryGirl.create :player }
  # let!(:player2) { FactoryGirl.create :player }
  # let!(:player3) { FactoryGirl.create :player }
  # let!(:player4) { FactoryGirl.create :player }
  # let!(:player5) { FactoryGirl.create :player }
  # let!(:player6) { FactoryGirl.create :player }
  # let!(:player7) { FactoryGirl.create :player }
  # let!(:player8) { FactoryGirl.create :player }
  # let!(:player9) { FactoryGirl.create :player }
  # let!(:player10) { FactoryGirl.create :player }
  # let(:roster1) { FactoryGirl.create :roster, name: "Illinois Towers" }
  # let(:roster2) { FactoryGirl.create :roster, name: "St. Simons Avians" }
  # let(:roster3) { FactoryGirl.create :roster, name: "Orlando Thunder" }
  # let(:roster4) { FactoryGirl.create :roster, name: "Fairfax Pitbulls" }
  # let(:roster5) { FactoryGirl.create :roster, name: "Des Moines Panthers" }
  # let(:roster6) { FactoryGirl.create :roster, name: "Golden Isles PhishHeads" }
  # let(:roster7) { FactoryGirl.create :roster, name: "Norfolk Dogs" }
  # let(:roster8) { FactoryGirl.create :roster, name: "Northern Virginia River Rats" }
  let!(:group_log1) { FactoryGirl.create :group_log, group: group }
  let!(:group_log2) { FactoryGirl.create :group_log, group: group }
  let!(:group_log3) { FactoryGirl.create :group_log, group: group }
  let!(:group_log4) { FactoryGirl.create :group_log, group: group }

  describe "#transactions" do
    it "has the correct default elements", :slow do
      visit group_transactions_path(group)
      page.should have_css("body.transactions")
      page.should have_css("h1", :text => "Transactions")
    end

    xit "redirects to first team group_roster show view", :slow do
      visit group_standings_path(group, roster3)
      find("tr.row-#{roster2.id} td.name a").click
      expect(current_path).to eq group_roster_path group, roster2
    end

    xit "redirects to player show view", :slow do
      visit group_standings_path(group, roster6)
      find("tr.row-#{transaction5.id} td.player a").click
      expect(current_path).to eq group_player_path group, player
    end
  end
end