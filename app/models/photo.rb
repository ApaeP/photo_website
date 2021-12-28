# == Schema Information
#
# Table name: photos
#
#  id               :bigint           not null, primary key
#  name             :string
#  description      :text
#  home             :boolean          default(FALSE)
#  cover_home       :boolean          default(FALSE)
#  menu             :boolean          default(FALSE)
#  main_category_id :bigint           not null
#  category_id      :bigint           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  contain_menu     :boolean          default(FALSE)
#  menu_position    :integer          default("center")
#
class Photo < ApplicationRecord
  # belongs_to :main_category
  belongs_to :category
  acts_as_list scope: :category

  has_one_attached :image

  enum menu_position: {
    center: 0,
    top: 10,
    bottom: 20
  }

  scope :for_home, -> { where( home: true ) }
  scope :for_menu, -> { where( menu: true ) }
end
