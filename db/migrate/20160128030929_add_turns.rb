class AddTurns < ActiveRecord::Migration
  def change
      create_table :turns do |t|
      t.references :player, index: true
      t.references :game, index: true
      t.references :card, index: true
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
