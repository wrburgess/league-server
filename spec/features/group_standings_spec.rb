require 'spec_helper'

describe "Group Standings Page" do
  let!(:group) { FactoryGirl.create :group }
  let(:roster1) { FactoryGirl.create :roster, name: "Illinois Towers" }
  let(:roster2) { FactoryGirl.create :roster, name: "St. Simons Avians" }
  let(:roster3) { FactoryGirl.create :roster, name: "Orlando Thunder" }
  let(:roster4) { FactoryGirl.create :roster, name: "Fairfax Pitbulls" }
  let(:roster5) { FactoryGirl.create :roster, name: "Des Moines Panthers" }
  let(:roster6) { FactoryGirl.create :roster, name: "Golden Isles PhishHeads" }
  let(:roster7) { FactoryGirl.create :roster, name: "Norfolk Dogs" }
  let(:roster8) { FactoryGirl.create :roster, name: "Northern Virginia River Rats" }

  describe "#standings" do
    before do
      group.rosters << roster1
      group.rosters << roster2
      group.rosters << roster3
      group.rosters << roster4
      group.rosters << roster5
      group.rosters << roster6
      group.rosters << roster7
      group.rosters << roster8
    end

    it "has the correct default elements", :slow do
      visit group_standings_path(group)
      page.should have_css("body.standings")
      page.should have_css("h1", :text => "Standings")
    end

    it "redirects to first team group_roster show view", :slow do
      visit group_standings_path(group, roster3)
      all("tr.row-#{roster2.id} td.name a")[1].click
      expect(current_path).to eq group_roster_path group, roster2
    end

    it "redirects to last team group_roster show view", :slow do
      visit group_standings_path(group, roster6)
      find("tr.row-#{roster8.id} td.name a").click
      expect(current_path).to eq group_roster_path group, roster8
    end
  end
end