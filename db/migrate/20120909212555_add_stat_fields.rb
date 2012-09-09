class AddStatFields < ActiveRecord::Migration
  def change
    add_column :game_stats, :week, :integer
    change_column :game_stats, :pa_att, :integer, :default => 0
    change_column :game_stats, :pa_comp, :integer, :default => 0
    change_column :game_stats, :pa_yd, :integer, :default => 0
    change_column :game_stats, :pa_td, :integer, :default => 0
    change_column :game_stats, :pa_int, :integer, :default => 0
    change_column :season_stats, :pa_att, :integer, :default => 0
    change_column :season_stats, :pa_comp, :integer, :default => 0
    change_column :season_stats, :pa_yd, :integer, :default => 0
    change_column :season_stats, :pa_td, :integer, :default => 0
    change_column :season_stats, :pa_int, :integer, :default => 0
    change_column :career_stats, :pa_att, :integer, :default => 0
    change_column :career_stats, :pa_comp, :integer, :default => 0
    change_column :career_stats, :pa_yd, :integer, :default => 0
    change_column :career_stats, :pa_td, :integer, :default => 0
    change_column :career_stats, :pa_int, :integer, :default => 0
  end
end
