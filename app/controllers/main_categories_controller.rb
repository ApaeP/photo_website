class MainCategoriesController < ApplicationController
  before_action :set_main_category, only: [:show]

  def show
    # @back_url = '/main_categories'
    @categories = @main_category.categories
  end

  def index
    @back_url = '/'
    @categories = MainCategory.all
  end

  private

  def set_main_category
    @main_category = MainCategory.find(params[:id])
  end
end
