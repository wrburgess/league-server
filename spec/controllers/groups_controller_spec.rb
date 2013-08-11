require 'spec_helper'

describe GroupsController do

  before do
    @group = FactoryGirl.create :group 
    @roster1 = FactoryGirl.create :roster, name: "Chicago Bulls", abbreviation: "CHI"
    @roster2 = FactoryGirl.create :roster, name: "Miami Marlins", abbreviation: "MIA"
    @roster3 = FactoryGirl.create :roster, name: "Atlanta Falcons", abbreviation: "ATL"
    @roster4 = FactoryGirl.create :roster, name: "Detroit Red Wings", abbreviation: "DET"
    @group.add_rosters [@roster1, @roster2, @roster3, @roster4]
  end

  describe "#draft" do
    it "renders the 'draft' template under the 'browser' layout" do
      get :draft, group_id: @group, id: @roster1
      response.should render_template :draft
      response.should render_template layout: "layouts/browser"
    end

    it "assigns the requested group to @group" do
      get :draft, group_id: @group, id: @roster1
      expect(assigns(:group)).to eq @group
    end
  end

  describe "#show" do
    it "renders the 'show' template under the 'browser' layout" do
      get :show, group_id: @group, id: @roster1
      response.should render_template :show
      response.should render_template layout: "layouts/browser"
    end

    it "assigns the requested group to @group" do
      get :show, group_id: @group, id: @roster1
      expect(assigns(:group)).to eq @group
    end
  end

  describe "#standings" do
    it "renders the 'standings' template under the 'browser' layout" do
      get :standings, group_id: @group
      response.should render_template :standings
      response.should render_template layout: "layouts/browser"
    end

    it "assigns the requested divisions to @divisions" do
      get :standings, group_id: @group
      rosters = @group.rosters
      @group_divisions = rosters.group_by { |roster| roster.group_divisions.first.name }
      expect(assigns(:group_divisions)).to eq @group_divisions
    end
  end

  describe "#transactions" do
    it "renders the 'transactions' template under the 'browser' layout" do
      get :transactions, group_id: @group, id: @roster1
      response.should render_template :transactions
      response.should render_template layout: "layouts/browser"
    end

    it "assigns the requested group to @group" do
      get :transactions, group_id: @group, id: @roster1
      expect(assigns(:group)).to eq @group
    end
  end

end