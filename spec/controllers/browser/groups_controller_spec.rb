require 'spec_helper'

describe Browser::GroupsController do

  before do
    @group = FactoryGirl.create(:group)
    @roster1 = FactoryGirl.create(:roster)
    @roster2 = FactoryGirl.create(:roster)
    @roster3 = FactoryGirl.create(:roster)
    @roster4 = FactoryGirl.create(:roster)
    @group.rosters << @roster1
    @group.rosters << @roster2
    @group.rosters << @roster3
    @group.rosters << @roster4
  end

  describe "#draft" do
    it "renders the 'draft' template under the 'browser' layout" do
      get :draft, group_id: @group, id: @roster1
      response.should render_template :draft
      response.should render_template layout: "layouts/browser"
    end
  end

  describe "#index" do
    it "renders the 'index' template under the 'browser' layout" do
      get :index, group_id: @group, id: @roster1
      response.should render_template :index
      response.should render_template layout: "layouts/browser"
    end
  end

  describe "#show" do
    it "renders the 'show' template under the 'browser' layout" do
      get :show, group_id: @group, id: @roster1
      response.should render_template :show
      response.should render_template layout: "layouts/browser"
    end
  end

  describe "#standings" do
    it "renders the 'standings' template under the 'browser' layout" do
      get :standings, group_id: @group, id: @roster1
      response.should render_template :standings
      response.should render_template layout: "layouts/browser"
    end
  end

  describe "#transactions" do
    it "renders the 'transactions' template under the 'browser' layout" do
      get :transactions, group_id: @group, id: @roster1
      response.should render_template :transactions
      response.should render_template layout: "layouts/browser"
    end
  end

end
