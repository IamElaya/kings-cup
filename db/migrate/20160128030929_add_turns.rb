class AddTurns < ActiveRecord::Migration
  def change
    create_table :turns do |t|
      t.integer :player_id, default: 0
      t.references :game, index: true
      t.references :card, index: true
      t.timestamps null: false
    end
  end
end
