# == Schema Information
#
# Table name: main_categories
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class MainCategory < ApplicationRecord
  include CategoriesHelper

  has_many :categories
  has_many :photos, through: :categories
  has_many :photos_for_menu, -> { where( menu: true ) },through: :categories, class_name: 'Photo'
end
