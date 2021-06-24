class PagesController < ApplicationController
  def home
    @categories = MainCategory.all
  end
end
