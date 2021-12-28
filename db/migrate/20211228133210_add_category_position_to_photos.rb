class AddCategoryPositionToPhotos < ActiveRecord::Migration[6.1]
  def change
    add_column :photos, :position, :integer
    Photo.order(:updated_at).each.with_index(1) do |photo, index|
      photo.update_column :position, index
    end
  end
end
