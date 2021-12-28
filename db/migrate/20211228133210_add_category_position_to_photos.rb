class AddCategoryPositionToPhotos < ActiveRecord::Migration[6.1]
  def change
    add_column :photos, :position, :integer
  end
end
