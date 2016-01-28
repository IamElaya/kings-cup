class AddPlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.references :game, index: true
      t.string :name
      t.integer :kings
      t.timestamps null: false
    end
  end
end
