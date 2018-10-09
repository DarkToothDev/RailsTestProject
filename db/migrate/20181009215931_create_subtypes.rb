class CreateSubtypes < ActiveRecord::Migration[5.2]
  def change
    create_table :subtypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
