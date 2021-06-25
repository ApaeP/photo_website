class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.string :name
      t.text :description
      t.boolean :home, default: false
      t.boolean :cover_home, default: false
      t.boolean :menu, default: false
      t.references :main_category, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
