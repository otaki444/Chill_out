class AddImageIdToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :image_id, :integer
  end
end
