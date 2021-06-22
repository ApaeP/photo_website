class CreateMainCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :main_categories do |t|
      t.string :title

      t.timestamps
    end
  end
end
