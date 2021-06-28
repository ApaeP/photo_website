class Photo < ApplicationRecord
  belongs_to :main_category
  belongs_to :category

  has_one_attached :image

  enum menu_position: {
    center: 0,
    top: 10,
    bottom: 20
  }

  scope :for_home, -> { where( home: true ) }
  scope :for_menu, -> { where( menu: true ) }
end
