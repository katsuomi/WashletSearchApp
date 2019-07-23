class AddImageToMaps < ActiveRecord::Migration[5.1]
  def change
    add_column :maps, :image, :string
  end
end
