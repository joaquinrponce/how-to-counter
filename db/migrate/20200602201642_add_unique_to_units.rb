class AddUniqueToUnits < ActiveRecord::Migration[6.0]
  def change
    add_column :units, :unique, :boolean, default: false
  end
end
