require 'spec_helper'

feature "Group Roster Views" do
  let!(:group) { FactoryGirl.create :group }
  let(:roster1) { FactoryGirl.create :roster, name: "Illinois Towers" }
  let(:roster2) { FactoryGirl.create :roster, name: "St. Simons Avians" }
  let(:roster3) { FactoryGirl.create :roster, name: "Orlando Thunder" }
  let(:roster4) { FactoryGirl.create :roster, name: "Fairfax Pitbulls" }

  describe "#index" do
    before do
      rosters = [roster1, roster2, roster3, roster4]
      group.add_rosters(rosters)
    end

    it "has the correct content and elements", :slow do
      visit group_rosters_path(group)
      expect(page).to have_css "body.rosters.index"
      expect(page).to have_content "Illinois"
      expect(page).to have_content "Fairfax"
    end

    it "redirects to group_roster show view", :slow do
      visit group_rosters_path(group)
      find("tr.row-#{roster1.id} td.name a").click
      expect(current_path).to eq group_roster_path group, roster1
    end
  end

  describe "#show" do
    it "has the correct content and elements", :slow do
      visit group_roster_path(group, roster2)
      expect(page).to have_css "body.rosters.show"
      expect(page).to have_content "St. Simons"
    end
  end
end