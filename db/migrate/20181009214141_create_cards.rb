class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :name
      t.integer :cmc
      t.string :colors
      t.string :type
      t.string :supertypes
      t.integer :type_id
      t.integer :subtype_id
      t.string :rarity
      t.string :text
      t.string :flavor
      t.integer :artist_id
      t.integer :number
      t.integer :power
      t.integer :toughness
      t.string :layout
      t.string :imagename

      t.timestamps
    end
  end
end
