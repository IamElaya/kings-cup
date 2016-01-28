class AddTurns < ActiveRecord::Migration
  def change
      create_table :turns do |t|
      t.integer :player_id
      t.integer :game_id
      t.integer :card_id
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
