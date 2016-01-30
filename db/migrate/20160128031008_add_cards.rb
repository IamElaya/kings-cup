class AddCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.references :turn, index: true
      t.references :game, index: true
      t.string :rank
      t.string :suit
      t.string :rule
      t.string :url
      t.boolean :used_at, default: false
      t.timestamps null: false
    end
  end
end
