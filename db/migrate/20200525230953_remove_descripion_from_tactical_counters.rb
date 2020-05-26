class RemoveDescripionFromTacticalCounters < ActiveRecord::Migration[6.0]
  def change
    remove_column :tactical_counters, :descripion, :text
    add_column :tactical_counters, :description, :text
  end
end
