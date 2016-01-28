class AddCards < ActiveRecord::Migration
  def change
      create_table :cards do |t|
      t.string :rank
      t.string :suit
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
