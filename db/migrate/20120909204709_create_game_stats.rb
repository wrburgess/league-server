class CreateGameStats < ActiveRecord::Migration
  def change
    create_table :game_stats do |t|
      t.integer :player_id
      t.integer :opponent_id
      t.date :game_date
      t.integer :season
      t.integer :pa_att
      t.integer :pa_comp
      t.integer :pa_td
      t.integer :pa_yd
      t.integer :pa_int

      t.timestamps
    end
  end
end
