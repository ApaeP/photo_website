class Category < ApplicationRecord
  include CategoriesHelper

  belongs_to :main_category
  has_many :photos
end
