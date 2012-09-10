class AddGroupFields < ActiveRecord::Migration
  def change
    add_column :groups, :name, :string, :null => false
  end
end
