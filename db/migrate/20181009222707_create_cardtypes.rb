class CreateCardtypes < ActiveRecord::Migration[5.2]
  def change
    create_table :cardtypes do |t|

      t.timestamps
    end
  end
end
