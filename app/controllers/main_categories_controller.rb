class MainCategoriesController < ApplicationController
  before_action :set_main_category, only: [:show]

  def show
    @categories = @main_category.categories
  end

  private

  def set_main_category
    @main_category = MainCategory.find(params[:id])
  end
end
