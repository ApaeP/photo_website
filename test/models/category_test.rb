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
require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
