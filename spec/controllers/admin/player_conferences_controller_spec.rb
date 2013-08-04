require 'spec_helper'

describe Admin::PlayerConferencesController do
  let(:player_conference1) { FactoryGirl.create(:player_conference) }
  let(:player_conference2) { FactoryGirl.create(:player_conference) }
  let(:player_conference3) { FactoryGirl.create(:player_conference) }
  let(:player_conferences) { PlayerConferences.all }

  describe "#index" do
    it "renders the Admin PlayerConference index view" do
      get :index
      response.should render_template :index
      response.should render_template layout: "layouts/admin"
    end

    it "assigns the requested playerconferences to @playerconferences" do
      get :index
      expect(assigns(player_conferences)).to eq @player_conferences
    end
  end

  describe "#show" do
    it "renders the Admin PlayerConference show view" do
      get :show, id: player_conference2
      response.should render_template :show
      response.should render_template layout: "layouts/admin"
    end

    it "assigns the requested PlayerConference to @playerconference" do
      get :show, id: player_conference2
      expect(assigns(playerconference2)).to eq @player_conference
    end
  end
  
  describe "#create" do
    it "adds a new PlayerConference to the database" do
      post :create, :player_conference => { name: "American Athletic", abbreviation: "AAC" }
      expect(PlayerConference.count).to eq 1
    end

    it "redirects to the Admin PlayerConference show view" do
      post :create, :player_conference => { name: "American Athletic", abbreviation: "AAC" }
      player_conference = PlayerConference.last
      expect(response).to redirect_to admin_player_conference_path player
    end
  end

  describe "#update" do
    it "updates a PlayerConference record in the database" do
      post :update, id: player_conference1, :player_conference => { name: "American Athletic" }, method: :patch
      player_conference1.reload
      expect(player_conference1.name).to eq "American Athletic"
    end

    it "redirects to the Admin Player show view" do
      post :update, id: player_conference2, :player_conference => { name: "American Athletic" }, method: :patch
      expect(response).to redirect_to admin_player_conference_path player_conference2
    end
  end

  describe "#destroy" do
    it "deletes a PlayerConference record from the database" do
      post :destroy, id: player_conference3, method: :delete
      expect { player_conference3.reload }.to raise_error ActiveRecord::RecordNotFound 
    end

    it "redirects to the Admin PlayerConference show view" do
      post :destroy, id: player_conference1, method: :delete
      expect(response).to redirect_to admin_player_conferences_path
    end
  end

end