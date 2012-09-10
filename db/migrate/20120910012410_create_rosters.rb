class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters do |t|
      t.string :name
      t.string :abbreviation

      t.timestamps
    end
  end
end
