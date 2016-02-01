class AddPlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.references :game, index: true
      t.string :name
      t.string :photo
      t.integer :kings, default: 0
      t.timestamps null: false
    end
  end
end
