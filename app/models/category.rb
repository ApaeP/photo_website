class Category < ApplicationRecord
  include CategoriesHelper

  belongs_to :main_category
  has_many :photos
  has_many :photos_for_menu, -> { where( menu: true ) }, class_name: 'Photo'
end
