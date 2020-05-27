class AddPictureUrlToUnits < ActiveRecord::Migration[6.0]
  def change
    add_column :units, :picture_url, :string
    add_column :units, :building, :string
  end
end
