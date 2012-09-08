class AddFieldsToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :location_name, :string
    add_column :teams, :nickname, :string
    add_column :teams, :abbreviation, :string
  end
end
