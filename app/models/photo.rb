class Photo < ApplicationRecord
  belongs_to :main_category
  belongs_to :category

  has_one_attached :image
end
