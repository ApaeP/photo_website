class PagesController < ApplicationController
  def home
    @photos = Photo.for_home.with_attached_image.shuffle
  end
end
