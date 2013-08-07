require 'spec_helper'

describe Admin::GroupsController do
  let(:group1) { FactoryGirl.create :group, name: "Pre Pro NFL", abbreviation: "PPNFL" }
  let(:group2) { FactoryGirl.create :group, name: "Pre Pro East", abbreviation: "PPE" }
  let(:group3) { FactoryGirl.create :group, name: "Pre Pro West", abbreviation: "PPW" }
  let(:groups) { Group.all }

  describe "#index" do
    it "renders the Admin Group index view" do
      get :index
      response.should render_template :index
      response.should render_template layout: "layouts/admin"
    end

    it "assigns the requested Group to @groups" do
      get :index
      expect(assigns(groups)).to eq @groups
    end
  end

  describe "#show" do
    it "renders the Admin Group show view" do
      get :show, id: group2
      response.should render_template :show
      response.should render_template layout: "layouts/admin"
    end

    it "assigns the requested Group to @playerconference" do
      get :show, id: group2
      expect(assigns(group2)).to eq @group
    end
  end
  
  describe "#update" do
    it "updates a Group record in the database" do
      post :update, id: group1, :group => { name: "Pre Pro America", abbreviation: "PPA" }, method: :patch
      group1.reload
      expect(group1.name).to eq "Pre Pro America"
    end

    it "redirects to the Admin Group show view" do
      post :update, id: group2, :group => { name: "Pre Pro Pacific", abbreviation: "PPP" }, method: :patch
      expect(response).to redirect_to admin_group_path group2
    end
  end
end