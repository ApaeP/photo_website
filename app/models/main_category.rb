class MainCategory < ApplicationRecord
  include CategoriesHelper

  has_many :categories
end
