class CreateTacticalCounters < ActiveRecord::Migration[6.0]
  def change
    create_table :tactical_counters do |t|
      t.integer :countered_unit_id
      t.integer :counter_unit_id

      t.timestamps
    end
  end
end
