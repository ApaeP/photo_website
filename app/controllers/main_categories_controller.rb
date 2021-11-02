class MainCategoriesController < ApplicationController
  before_action :set_main_category, only: [:show]

  def show
    @categories = @main_category.categories.includes(photos_for_menu: { image_attachment: :blob })
  end

  def index
    @back_url = '/'
    @categories = MainCategory.includes(photos_for_menu: { image_attachment: :blob })
  end

  private

  def photos
    @main_category.includes(photos: { image_attachment: :blob })
  end

  def set_main_category
    @main_category = MainCategory.find(params[:id])
  end
end
