class CreateRosterManagers < ActiveRecord::Migration
  def change
    create_table :roster_managers do |t|
      t.integer :user_id
      t.integer :roster_id

      t.timestamps
    end
  end
end
