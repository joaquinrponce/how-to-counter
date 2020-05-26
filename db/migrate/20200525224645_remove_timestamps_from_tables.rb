class RemoveTimestampsFromTables < ActiveRecord::Migration[6.0]
  def change
    remove_column :units, :created_at, :string
    remove_column :units, :updated_at, :string
    remove_column :direct_counters, :created_at, :string
    remove_column :direct_counters, :updated_at, :string
    remove_column :tactical_counters, :created_at, :string
    remove_column :tactical_counters, :updated_at, :string
  end
end
