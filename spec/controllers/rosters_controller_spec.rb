require 'spec_helper'

describe RostersController do
  let!(:group) { FactoryGirl.create(:group) }
  let!(:roster1) { FactoryGirl.create(:roster) }
  let!(:roster2) { FactoryGirl.create(:roster) }
  let!(:roster3) { FactoryGirl.create(:roster) }
  let!(:roster4) { FactoryGirl.create(:roster) }
  let!(:roster5) { FactoryGirl.create(:roster) }
  let!(:roster6) { FactoryGirl.create(:roster) }
  let!(:roster7) { FactoryGirl.create(:roster) }
  let!(:roster8) { FactoryGirl.create(:roster) }
  let!(:roster9) { FactoryGirl.create(:roster) }
  let!(:roster10) { FactoryGirl.create(:roster) }
  let!(:roster11) { FactoryGirl.create(:roster) }
  let!(:roster12) { FactoryGirl.create(:roster) }
  let!(:rosters) { Roster.all }

  describe "#index" do
    it "renders the Roster index view" do
      get :index, group_id: group
      response.should render_template :index
      response.should render_template layout: "layouts/browser"
    end

    it "assigns the requested player to @roster" do
      get :index, group_id: group
      expect(assigns(roster2)).to eq @roster
    end
  end

  describe "#show" do
    it "renders the Roster show view" do
      get :show, id: roster2, group_id: group
      response.should render_template :show
      response.should render_template layout: "layouts/browser"
    end

    it "assigns the requested player to @roster" do
      get :show, id: roster2, group_id: group
      expect(assigns(roster2)).to eq @roster
    end
  end
end