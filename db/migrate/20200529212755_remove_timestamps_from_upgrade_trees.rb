class RemoveTimestampsFromUpgradeTrees < ActiveRecord::Migration[6.0]
  def change
    remove_column :upgrade_trees, :created_at, :string
    remove_column :upgrade_trees, :updated_at, :string
  end
end
