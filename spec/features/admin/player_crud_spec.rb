require 'spec_helper'

feature "Admin Player CRUD" do
  let!(:player_position1) { FactoryGirl.create(:player_position, name: "Guard", abbreviation: "G") }
  let!(:player_position2) { FactoryGirl.create(:player_position, name: "Center", abbreviation: "C") }
  let!(:player_position3) { FactoryGirl.create(:player_position, name: "Forward", abbreviation: "F") }
  let!(:player_team1) { FactoryGirl.create(:player_team, location_name: "Georgia", abbreviation: "GA") }
  let!(:player_team2) { FactoryGirl.create(:player_team, location_name: "Florida", abbreviation: "FLA") }
  let!(:player_team3) { FactoryGirl.create(:player_team, location_name: "Alabama", abbreviation: "ALA") }
  let(:player1) { FactoryGirl.create(:player) }
  let(:player2) { FactoryGirl.create(:player, first_name: "Todd", last_name: "Gurley") }
  let(:player3) { FactoryGirl.create(:player, first_name: "Keith", last_name: "Marshall") }

  describe "#index" do
    before do
      player1
      player2
      player3
    end

    it "has the correct content and elements", :slow do
      visit admin_players_path
      expect(page).to have_css "body.players.index"
      expect(page).to have_content "Hines"
      expect(page).to have_content "Keith"
    end

    it "redirects to admin_player new view", :slow do
      visit admin_players_path
      click_link "Add Player"
      expect(current_path).to eq new_admin_player_path
    end

    it "redirects to admin_player show view", :slow do
      visit admin_players_path
      find("tr.row-#{player3.id} .show a").click
      expect(current_path).to eq admin_player_path player3
    end

    it "redirects to admin_player edit view", :slow do
      visit admin_players_path
      find("tr.row-#{player2.id} .edit a").click
      expect(current_path).to eq edit_admin_player_path player2
    end
  end

  describe "#show" do
    it "has the correct content and elements", :slow do
      visit admin_player_path(player1)
      expect(page).to have_css "body.players.show"
      expect(page).to have_content "Hines"
    end

    it "redirects to admin_player edit view", :slow do
      visit admin_player_path(player1)
      click_link "Edit"
      expect(current_path).to eq edit_admin_player_path player1
    end

    it "deletes existing player, redirects to admin_player index view", :slow do
      visit admin_player_path(player1)
      click_link "Delete"
      expect(current_path).to eq admin_players_path
      expect(page).to have_content "Player deleted"
      expect { player1.reload }.to raise_error ActiveRecord::RecordNotFound
    end
  end

  describe "#new" do
    it "adds a new player, redirects to admin_player show view", :slow do
      visit new_admin_player_path
      expect(page).to have_css "body.players.new"

      fill_in "player[first_name]", with: "Todd"
      fill_in "player[last_name]", with: "Gurley"
      select "FLA", from: "player[player_team_id]"
      select "G", from: "player[player_position_id]"
      click_button "Create Player"
      player = Player.where(first_name: "Todd", last_name: "Gurley")
      expect(player.count).to eq 1
      expect(current_path).to eq admin_player_path player.first
      expect(page).to have_content "Player created"
    end
  end

  describe "#edit" do
    it "edits an existing player, redirects to admin_player show view", :slow do
      visit edit_admin_player_path player1
      expect(page).to have_css "body.players.edit"

      fill_in "player[first_name]", with: "Aaron"
      fill_in "player[last_name]", with: "Murray"
      select "ALA", from: "player[player_team_id]"
      select "G", from: "player[player_position_id]"
      click_button "Update Player"
      player1.reload
      expect(player1.first_name).to eq "Aaron"
      expect(player1.last_name).to eq "Murray"
      expect(player1.player_position.abbreviation).to eq "G"
      expect(player1.player_team.abbreviation).to eq "ALA"
      expect(current_path).to eq admin_player_path player1
      expect(page).to have_content "Player updated"
    end
  end

end