require 'spec_helper'

feature "Admin Player CRUD" do

  let(:player1) { FactoryGirl.create(:player) }
  let(:player2) { FactoryGirl.create(:player) }
  let(:player3) { FactoryGirl.create(:player) }
  let(:player4) { FactoryGirl.create(:player) }

  before do
    player_position1 = FactoryGirl.create(:player_position, name: "Guard", abbreviation: "G")
    player_position2 = FactoryGirl.create(:player_position, name: "Center", abbreviation: "C")
    player_position3 = FactoryGirl.create(:player_position, name: "Forward", abbreviation: "F")
    player_team1 = FactoryGirl.create(:player_team, location_name: "Georgia", abbreviation: "GA")
    player_team2 = FactoryGirl.create(:player_team, location_name: "Florida", abbreviation: "FLA")
    player_team3 = FactoryGirl.create(:player_team, location_name: "Alabama", abbreviation: "ALA")
  end

  describe "#index" do
    it "has the correct default elements" do
      visit admin_players_path
      expect(page).to have_css "body.players.index"
    end

    it "has the correct content" do
      player1
      player2
      player3
      visit admin_players_path
      expect(page).to have_content "Hines"
      expect(page).to have_content "Ward"
      expect(page).to_not have_content "Bob"
    end
  end

  describe "#show" do
    it "has the correct default elements" do
      visit admin_player_path(player1)
      expect(page).to have_css "body.players.show"
    end

    it "has the correct content" do
      visit admin_player_path(player1)
      expect(page).to have_content "Hines"
      expect(page).to have_content "Ward"
      expect(page).to have_content "GA"
      expect(page).to have_content "Center"
      expect(page).to_not have_content "Bob"
    end
  end

  describe "#new" do
    it "has the correct default elements" do
      visit new_admin_player_path
      expect(page).to have_css "body.players.new" 
    end

    it "adds a new player, redirects to admin_player show view" do
      visit new_admin_player_path
      fill_in "player[first_name]", with: "Todd"
      fill_in "player[last_name]", with: "Gurley"
      select "FLA", from: "player[player_team_id]"
      select "G", from: "player[player_position_id]"
      click_button "Create Player"
      player = Player.where(first_name: "Todd", last_name: "Gurley")
      expect(player.count).to eq 1
      expect(current_path).to eq admin_player_path player.first
    end
  end

  describe "#edit" do
    it "has the correct default elements" do
      visit edit_admin_player_path player1
      expect(page).to have_css "body.players.edit"
    end

    it "edits an existing player, redirects to admin_player show view" do
      visit edit_admin_player_path player1
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
    end
  end

end