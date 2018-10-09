class CreateCardsubtypes < ActiveRecord::Migration[5.2]
  def change
    create_table :cardsubtypes do |t|
      t.references :card, foreign_key: true
      t.references :type, foreign_key: true

      t.string :name
      t.timestamps
    end
  end
end
