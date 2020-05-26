class AddDescriptionToTacticalCounters < ActiveRecord::Migration[6.0]
  def change
    add_column :tactical_counters, :descripion, :text
  end
end
