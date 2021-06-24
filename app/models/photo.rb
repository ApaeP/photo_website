class Photo < ApplicationRecord
  belongs_to :main_category
  belongs_to :category

  has_one_attached :image

  scope :home, -> { where( home: true ) }
  scope :menu, -> { where( menu: true ) }
end
