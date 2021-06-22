require "test_helper"

class MainCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get main_categories_show_url
    assert_response :success
  end
end
