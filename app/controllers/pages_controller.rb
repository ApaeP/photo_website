class PagesController < ApplicationController
  def home
    @categories = MainCategory.all
  end
  def home_2
    @categories = MainCategory.all
  end
end
