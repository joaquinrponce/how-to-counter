class ChangeUnitDescriptionToText < ActiveRecord::Migration[6.0]
  def change
    change_column :units, :description, :text
  end
end
