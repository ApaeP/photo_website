# == Schema Information
#
# Table name: categories
#
#  id               :bigint           not null, primary key
#  title            :string
#  main_category_id :bigint           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Category < ApplicationRecord
  include CategoriesHelper

  belongs_to :main_category
  has_many :photos, -> { order(position: :asc) }, dependent: :destroy
  has_many :photos_for_menu, -> { where( menu: true ) }, class_name: 'Photo'
end
