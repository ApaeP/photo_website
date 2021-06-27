class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :show_swiper]

  def show
    @photos = photos
  end

  def show_swiper
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
