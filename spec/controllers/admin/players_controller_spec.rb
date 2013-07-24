require 'spec_helper'

describe Admin::PlayersController do
  
  describe "#create" do
    it "adds a new player to the database" do
      post :create, :player => { first_name: "Joe", last_name: "Smith", player_team_id: "1", player_position_id: "1" }
      expect(Player.count).to eq(1)
    end

    it "redirects to the Admin Player Index" do
      post :create, :player => { first_name: "Joe", last_name: "Smith", player_team_id: "1", player_position_id: "1" }
      player = Player.last
      expect(response).to redirect_to admin_players_path(player)
    end
  end

  describe "#update" do

  end

  describe "#destroy" do

  end

end