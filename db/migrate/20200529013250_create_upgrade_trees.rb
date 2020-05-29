class CreateUpgradeTrees < ActiveRecord::Migration[6.0]
  def change
    create_table :upgrade_trees do |t|
      t.string :name

      t.timestamps
    end
  end
end
