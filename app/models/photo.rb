class Photo < ApplicationRecord
  belongs_to :main_category
  belongs_to :category

  has_one_attached :image

  scope :for_home, -> { where( home: true ) }
  scope :for_menu, -> { where( menu: true ) }
end
