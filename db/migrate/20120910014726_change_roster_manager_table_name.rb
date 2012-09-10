class ChangeRosterManagerTableName < ActiveRecord::Migration
  def change
    rename_table :roster_managers, :roster_users
    add_column :roster_users, :owner, :boolean, :default => true
    add_column :roster_users, :viewer, :boolean, :default => true
    add_column :group_users, :owner, :boolean, :default => false
    add_column :group_users, :viewer, :boolean, :default => true
  end
end
