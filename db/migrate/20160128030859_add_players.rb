class AddPlayers < ActiveRecord::Migration
  def change
      create_table :players do |t|
      t.integer :game_id
      t.string :name
      t.integer :kings
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
