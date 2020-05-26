class AddDescriptionToDirectCounters < ActiveRecord::Migration[6.0]
  def change
    add_column :direct_counters, :description, :text
  end
end
