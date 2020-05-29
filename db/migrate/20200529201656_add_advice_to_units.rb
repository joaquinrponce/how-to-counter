class AddAdviceToUnits < ActiveRecord::Migration[6.0]
  def change
    add_column :units, :advice, :text
  end
end
