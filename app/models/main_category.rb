class MainCategory < ApplicationRecord
  include CategoriesHelper

  has_many :categories
  has_many :photos
end
