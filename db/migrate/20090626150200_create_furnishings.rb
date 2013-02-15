class CreateFurnishings < ActiveRecord::Migration
  def self.up
    create_table :furnishings do |t|
      t.string :img
      t.text :dimensions_description
      t.string :name
      t.text :description
      t.string :alter
      t.string :shape
      t.float :seats
      t.boolean :is_main, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :furnishings
  end
end
