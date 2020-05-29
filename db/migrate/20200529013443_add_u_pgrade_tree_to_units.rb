class AddUPgradeTreeToUnits < ActiveRecord::Migration[6.0]
  def change
    add_reference :units, :upgrade_tree
  end
end
