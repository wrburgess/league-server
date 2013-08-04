require 'spec_helper'

feature "Admin PlayerConference CRUD" do
  let(:player_conference1) { FactoryGirl.create(:player_conference) }
  let(:player_conference2) { FactoryGirl.create(:player_conference, name: "Atlantic Coast", abbreviation: "ACC") }
  let(:player_conference3) { FactoryGirl.create(:player_conference, name: "PAC 12", abbreviation: "PAC12") }

  describe "#index" do
    before do
      player_conference1
      player_conference2
      player_conference3
    end

    it "has the correct content and elements", :slow do
      visit admin_player_conferences_path
      expect(page).to have_css "body.player_conferences.index"
      expect(page).to have_content "ACC"
      expect(page).to have_content "PAC12"
    end

    it "redirects to admin_player_conference new view", :slow do
      visit admin_player_conferences_path
      click_link "Add Conference"
      expect(current_path).to eq new_admin_player_conference_path
    end

    it "redirects to admin_player_conference show view", :slow do
      visit admin_player_conferences_path
      find("tr.row-#{player_conference3.id} .show a").click
      expect(current_path).to eq admin_player_conference_path player_conference3
    end

    it "redirects to admin_player_conference edit view", :slow do
      visit admin_player_conferences_path
      find("tr.row-#{player_conference2.id} .edit a").click
      expect(current_path).to eq edit_admin_player_conference_path player_conference2
    end
  end

  describe "#show" do
    it "has the correct content and elements", :slow do
      visit admin_player_conference_path(player_conference1)
      expect(page).to have_css "body.player_conferences.show"
      expect(page).to have_content "SEC"
    end

    it "redirects to admin_player_conference edit view", :slow do
      visit admin_player_conference_path(player_conference1)
      click_link "Edit"
      expect(current_path).to eq edit_admin_player_conference_path player_conference1
    end

    it "deletes existing player, redirects to admin_player index view", :slow do
      visit admin_player_conference_path(player_conference1)
      click_link "Delete"
      expect(current_path).to eq admin_player_conferences_path
      expect(page).to have_content "Conference deleted"
      expect { player_conference1.reload }.to raise_error ActiveRecord::RecordNotFound
    end
  end

  describe "#new" do
    it "adds a new PlayerConference, redirects to admin_player_conference show view", :slow do
      visit new_admin_player_conference_path
      expect(page).to have_css "body.player_conferences.new"

      fill_in "player_conference[name]", with: "American Athletic"
      fill_in "player_conference[abbreviation]", with: "AAC"
      click_button "Create Conference"
      player_conference = PlayerConference.where(name: "American Athletic", abbreviation: "AAC")
      expect(player_conference.count).to eq 1
      expect(current_path).to eq admin_player_conference_path player_conference.first
      expect(page).to have_content "Conference created"
    end
  end

  describe "#edit" do
    it "edits an existing PlayerConference, redirects to admin_player_conference show view", :slow do
      visit edit_admin_player_conference_path player_conference1
      expect(page).to have_css "body.player_conferences.edit"

      fill_in "player_conference[name]", with: "Mountain West"
      fill_in "player_conference[abbreviation]", with: "MWC"
      click_button "Update Conference"
      player_conference1.reload
      expect(player_conference1.name).to eq "Mountain West"
      expect(player_conference1.abbreviation).to eq "MWC"
      expect(current_path).to eq admin_player_conference_path player_conference1
      expect(page).to have_content "Conference updated"
    end
  end

end