class CreateDrawings < ActiveRecord::Migration[5.2]
  def change
    create_table :drawings do |t|
      t.integer :game_id
      t.boolean :draw, default: false
      t.json :plots, default: []
      t.string :color, default: "#1b1b1b"
      t.integer :lineWidth, default: 5
      t.timestamps
    end
  end
end
