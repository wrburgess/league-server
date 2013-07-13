require 'spec_helper'

describe Browser::GroupsController, :type => :controller do

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

    it "assigns the requested group to @group" do
      get :draft, group_id: @group, id: @roster1
      expect(assigns(:group)).to eq @group
    end
  end

  describe "#show" do
    
    it "should respond with status code 200" do
      subject { get :show, group_id: @group, id: @roster1 }
      response.should respond_with 200
    end

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
      get :standings, group_id: @group, id: @roster1
      response.should render_template :standings
      response.should render_template layout: "layouts/browser"
    end

    it "assigns the requested group to @group" do
      get :standings, group_id: @group, id: @roster1
      expect(assigns(:group)).to eq @group
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
