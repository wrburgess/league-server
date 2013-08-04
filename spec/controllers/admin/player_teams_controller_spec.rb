require 'spec_helper'

describe Admin::PlayerTeamsController do
  let(:player_team1) { FactoryGirl.create(:player_team) }
  let(:player_team2) { FactoryGirl.create(:player_team) }
  let(:player_team3) { FactoryGirl.create(:player_team) }
  let(:player_teams) { PlayerTeam.all }

  describe "#index" do
    it "renders the Admin PlayerTeam index view" do
      get :index
      response.should render_template :index
      response.should render_template layout: "layouts/admin"
    end

    it "assigns the requested PlayerTeam to @player_teams" do
      get :index
      expect(assigns(player_teams)).to eq @player_teams
    end
  end

  describe "#show" do
    it "renders the Admin PlayerTeam show view" do
      get :show, id: player_team2
      response.should render_template :show
      response.should render_template layout: "layouts/admin"
    end

    it "assigns the requested PlayerTeam to @playerconference" do
      get :show, id: player_team2
      expect(assigns(player_team2)).to eq @player_team
    end
  end
  
  describe "#create" do
    it "adds a new PlayerTeam to the database" do
      post :create, :player_team => { location_name: "Alabama", nickname: "Crimson Tide", abbreviation: "ALA", player_conference_id: "2" }
      expect(PlayerTeam.count).to eq 1
    end

    it "redirects to the Admin PlayerTeam show view" do
      post :create, :player_team => { location_name: "Alabama", nickname: "Crimson Tide", abbreviation: "ALA", player_conference_id: "2" }
      player_team = PlayerTeam.last
      expect(response).to redirect_to admin_player_team_path player_team
    end
  end

  describe "#update" do
    it "updates a PlayerTeam record in the database" do
      post :update, id: player_team1, :player_team => { location_name: "Louisville" }, method: :patch
      player_team1.reload
      expect(player_team1.name).to eq "Louisville"
    end

    it "redirects to the Admin PlayerTeam show view" do
      post :update, id: player_team2, :player_team => { name: "Florida State" }, method: :patch
      expect(response).to redirect_to admin_player_team_path player_team2
    end
  end

  describe "#destroy" do
    it "deletes a PlayerTeam record from the database" do
      post :destroy, id: player_team3, method: :delete
      expect { player_team3.reload }.to raise_error ActiveRecord::RecordNotFound 
    end

    it "redirects to the Admin PlayerTeam show view" do
      post :destroy, id: player_team1, method: :delete
      expect(response).to redirect_to admin_player_teams_path
    end
  end

end