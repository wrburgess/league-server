require 'spec_helper'

feature "Admin Group CRUD" do
  let(:group1) { FactoryGirl.create :group, name: "Pre Pro NFL", abbreviation: "PPNFL" }
  let(:group2) { FactoryGirl.create :group, name: "Pre Pro East", abbreviation: "PPE" }
  let(:group3) { FactoryGirl.create :group, name: "Pre Pro West", abbreviation: "PPW" }

  describe "#index" do
    before do
      group1
      group2
      group3
    end

    it "has the correct content and elements", :slow do
      visit admin_groups_path
      expect(page).to have_css "body.groups.index"
      expect(page).to have_content group1.name
      expect(page).to have_content group3.abbreviation
    end

    it "redirects to admin_group show view", :slow do
      visit admin_groups_path
      find("tr.row-#{group3.id} .show a").click
      expect(current_path).to eq admin_group_path group3
    end

    it "redirects to admin_group edit view", :slow do
      visit admin_groups_path
      find("tr.row-#{group2.id} .edit a").click
      expect(current_path).to eq edit_admin_group_path group2
    end
  end

  describe "#show" do
    it "has the correct content and elements", :slow do
      visit admin_group_path(group1)
      expect(page).to have_css "body.groups.show"
      expect(page).to have_content group1.name
    end

    it "redirects to admin_group edit view", :slow do
      visit admin_group_path(group1)
      click_link "Edit"
      expect(current_path).to eq edit_admin_group_path group1
    end
  end

  describe "#edit" do
    it "edits an existing Group, redirects to admin_group show view", :slow do
      visit edit_admin_group_path group1
      expect(page).to have_css "body.groups.edit"

      fill_in "group[name]", with: "Pre Pro Hoops South"
      fill_in "group[abbreviation]", with: "PPHS"
      click_button "Update #{AppSettings.app_alias_group.capitalize}"
      group1.reload
      expect(group1.name).to eq "Pre Pro Hoops South"
      expect(group1.abbreviation).to eq "PPHS"
      expect(current_path).to eq admin_group_path group1
      expect(page).to have_content "#{AppSettings.app_alias_group.capitalize} updated"
    end
  end
end