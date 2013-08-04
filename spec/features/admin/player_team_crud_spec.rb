require 'spec_helper'

feature "Admin PlayerTeam CRUD" do
  let!(:player_conference1) { FactoryGirl.create(:player_conference, name: "Southeeastern", abbreviation: "SEC") }
  let!(:player_conference2) { FactoryGirl.create(:player_conference, name: "Atlantic Coast", abbreviation: "ACC") }
  let(:player_team1) { FactoryGirl.create(:player_team, location_name: "Georgia", nickname: "Bulldogs", abbreviation: "GA", player_conference: player_conference1) }
  let(:player_team2) { FactoryGirl.create(:player_team, location_name: "Florida State", nickname: "Seminoles", abbreviation: "FSU", player_conference: player_conference2) }
  let(:player_team3) { FactoryGirl.create(:player_team, location_name: "LSU", nickname: "Tigers", abbreviation: "LSU", player_conference: player_conference1) }

  describe "#index" do
    # before do
    #   player_conference1
    #   player_conference2
    # end

    it "has the correct content and elements", :slow do
      visit admin_player_teams_path
      expect(page).to have_css "body.player_conferences.index"
      expect(page).to have_content "Georgia"
      expect(page).to have_content "Florida State"
    end

    it "redirects to admin_player_conference new view", :slow do
      visit admin_player_teams_path
      click_link "Add School"
      expect(current_path).to eq new_admin_player_team_path
    end

    it "redirects to admin_player_team show view", :slow do
      visit admin_player_teams_path
      find("tr.row-#{player_team3.id} .show a").click
      expect(current_path).to eq admin_player_team_path player_team3
    end

    it "redirects to admin_player_team edit view", :slow do
      visit admin_player_teams_path
      find("tr.row-#{player_team2.id} .edit a").click
      expect(current_path).to eq edit_admin_player_team_path player_team2
    end
  end

  describe "#show" do
    it "has the correct content and elements", :slow do
      visit admin_player_team_path(player_team1)
      expect(page).to have_css "body.player_teams.show"
      expect(page).to have_content "Georgia"
    end

    it "redirects to admin_player_team edit view", :slow do
      visit admin_player_conference_path(player_team1)
      click_link "Edit"
      expect(current_path).to eq edit_admin_player_team_path player_team1
    end

    it "deletes existing player, redirects to admin_player index view", :slow do
      visit admin_player_team_path(player_team1)
      click_link "Delete"
      expect(current_path).to eq admin_player_teams_path
      expect(page).to have_content "School deleted"
      expect { player_team1.reload }.to raise_error ActiveRecord::RecordNotFound
    end
  end

  describe "#new" do
    it "adds a new PlayerTeam, redirects to admin_player_team show view", :slow do
      visit new_admin_player_team_path
      expect(page).to have_css "body.player_teams.new"

      fill_in "player_team[location_name]", with: "Tennessee"
      fill_in "player_team[nickname]", with: "Volunteers"
      fill_in "player_team[abbreviation]", with: "TENN"
      select "SEC", from: "player_team[player_conference_id]"
      click_button "Create School"
      player_team = PlayerTeam.where(location_name: "Tennessee", nickname: "Volunteers")
      expect(player_team.count).to eq 1
      expect(current_path).to eq admin_player_team_path player_team.first
      expect(page).to have_content "School created"
    end
  end

  describe "#edit" do
    it "edits an existing PlayerTeam, redirects to admin_player_conference show view", :slow do
      visit edit_admin_player_team_path player_team1
      expect(page).to have_css "body.player_teams.edit"

      fill_in "player_team[name]", with: "Clemson"
      fill_in "player_team[nickname]", with: "Tigers"
      fill_in "player_team[abbreviation]", with: "CLEM"
      select "ACC", from: "player_team[player_conference_id]"
      click_button "Update School"
      player_team1.reload
      expect(player_team1.location_name).to eq "Clemson"
      expect(player_team1.nickname).to eq "Tigers"
      expect(player_team1.abbreviation).to eq "CLEM"
      expect(player_team.player_conference.abbreviation).to eq "ACC"
      expect(current_path).to eq admin_player_team_path player_team1
      expect(page).to have_content "School updated"
    end
  end
end