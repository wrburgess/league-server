require 'spec_helper'

describe Admin::RostersController do
  let(:roster1) { FactoryGirl.create :roster, name: "Illinois Fielders", abbreviation: "ILL" }
  let(:roster2) { FactoryGirl.create :roster, name: "Fairfax Pit Bulls", abbreviation: "FFX" }
  let(:roster3) { FactoryGirl.create :roster, name: "Golden Isles PhishHeads", abbreviation: "GOI" }
  let(:rosters) { Roster.all }

  describe "#index" do
    it "renders the Admin Roster index view" do
      get :index
      response.should render_template :index
      response.should render_template layout: "layouts/admin"
    end

    it "assigns the requested Roster to @rosters" do
      get :index
      expect(assigns(rosters)).to eq @rosters
    end
  end

  describe "#show" do
    it "renders the Admin Roster show view" do
      get :show, id: roster2
      response.should render_template :show
      response.should render_template layout: "layouts/admin"
    end

    it "assigns the requested Roster to @roster" do
      get :show, id: roster2
      expect(assigns(roster2)).to eq @roster
    end
  end
  
  describe "#update" do
    it "updates a Roster record in the database" do
      post :update, id: roster1, :roster => { name: "St. Simons Avians", abbreviation: "SSI" }, method: :patch
      roster1.reload
      expect(roster1.name).to eq "St. Simons Avians"
    end

    it "redirects to the Admin Roster show view" do
      post :update, id: roster2, :roster => { name: "Norcross", abbreviation: "Colt45s" }, method: :patch
      expect(response).to redirect_to admin_roster_path roster2
    end
  end
end