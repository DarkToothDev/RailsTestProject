class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :name
      t.integer :cmc
      t.string :colors
      t.string :type_text
      t.string :supertypes
      t.string :text
      t.string :flavor
      t.references :artist, foreign_key: true
      t.integer :power
      t.integer :toughness
      t.string :layout
      t.string :imagename

      t.timestamps
    end
  end
end
