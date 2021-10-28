class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :show_swiper]

  def show
    @back_url = "/main_categories/#{@category.main_category.id}"
    @photos = photos
  end

  def show_swiper
    @back_url = "/categories/#{@category.id}"
    @photos = photos.rotate(params[:rotate].to_i)
  end

  private

  def photos
    @category.photos
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
