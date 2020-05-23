class CreateUnits < ActiveRecord::Migration[6.0]
  def change
    create_table :units do |t|
      t.string :name
      t.string :description
      t.integer :attack
      t.integer :armor
      t.integer :pierce_armor
      t.integer :range
      t.integer :accuracy
      t.integer :hp

      t.timestamps
    end
  end
end
