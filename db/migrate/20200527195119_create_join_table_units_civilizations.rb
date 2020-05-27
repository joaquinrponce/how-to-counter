class CreateJoinTableUnitsCivilizations < ActiveRecord::Migration[6.0]
  def change
    create_join_table :units, :civilizations do |t|
      t.index [:unit_id, :civilization_id]
      t.index [:civilization_id, :unit_id]
    end
  end
end
