class AddPositionToPhotos < ActiveRecord::Migration[6.1]
  def change
    add_column :photos, :contain_menu, :boolean, default: false
    add_column :photos, :menu_position, :integer, index: true, default: 0
  end
end
