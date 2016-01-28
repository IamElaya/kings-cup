class AddGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :current_player, default: 1
      t.boolean :game_over, default: false
      t.timestamps null: false
    end
  end
end
