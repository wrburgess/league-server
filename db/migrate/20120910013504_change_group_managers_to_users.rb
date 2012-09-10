class ChangeGroupManagersToUsers < ActiveRecord::Migration
  def change
    rename_table :group_managers, :group_users
  end
end
