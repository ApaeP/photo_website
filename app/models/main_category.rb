class MainCategory < ApplicationRecord
  include CategoriesHelper

  has_many :categories
  has_many :photos, through: :categories
  has_many :photos_for_menu, -> { where( menu: true ) },through: :categories, class_name: 'Photo'
end
