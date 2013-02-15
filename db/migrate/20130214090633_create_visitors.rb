class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :name
      t.string :email
      t.string :telephone
      t.string :postcode
      t.string :heard_from
      t.text :message

      t.timestamps
    end
  end
end
