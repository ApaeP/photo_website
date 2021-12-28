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
require "test_helper"

class PhotoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
