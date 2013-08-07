require 'spec_helper'

feature "Admin Roster CRUD" do
  let(:roster1) { FactoryGirl.create :roster, name: "Orlando Thunder", abbreviation: "ORL" }
  let(:roster2) { FactoryGirl.create :roster, name: "Norfolk Dogs", abbreviation: "NFK" }
  let(:roster3) { FactoryGirl.create :roster, name: "Texas Turtleheads", abbreviation: "TEX" }

  describe "#index" do
    before do
      roster1
      roster2
      roster3
    end

    it "has the correct content and elements", :slow do
      visit admin_rosters_path
      expect(page).to have_css "body.rosters.index"
      expect(page).to have_content roster1.name
      expect(page).to have_content roster3.abbreviation
    end

    it "redirects to admin_roster show view", :slow do
      visit admin_rosters_path
      find("tr.row-#{roster3.id} .show a").click
      expect(current_path).to eq admin_roster_path roster3
    end

    it "redirects to admin_roster edit view", :slow do
      visit admin_rosters_path
      find("tr.row-#{roster2.id} .edit a").click
      expect(current_path).to eq edit_admin_roster_path roster2
    end
  end

  describe "#show" do
    it "has the correct content and elements", :slow do
      visit admin_roster_path(roster1)
      expect(page).to have_css "body.rosters.show"
      expect(page).to have_content roster1.name
    end

    it "redirects to admin_roster edit view", :slow do
      visit admin_roster_path(roster1)
      click_link "Edit"
      expect(current_path).to eq edit_admin_roster_path roster1
    end
  end

  describe "#edit" do
    it "edits an existing Roster, redirects to admin_roster show view", :slow do
      visit edit_admin_roster_path roster1
      expect(page).to have_css "body.rosters.edit"

      fill_in "roster[name]", with: "East Cobb Cougars"
      fill_in "roster[abbreviation]", with: "ECB"
      click_button "Update #{AppSettings.app_alias_roster.capitalize}"
      roster1.reload
      expect(roster1.name).to eq "East Cobb Cougars"
      expect(roster1.abbreviation).to eq "ECB"
      expect(current_path).to eq admin_roster_path roster1
      expect(page).to have_content "#{AppSettings.app_alias_roster.capitalize} updated"
    end
  end
end