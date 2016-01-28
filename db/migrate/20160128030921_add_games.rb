class AddGames < ActiveRecord::Migration
  def change
      create_table :games do |t|
      t.integer :current_player, default: 1
      t.boolean :game_over, default: false
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
