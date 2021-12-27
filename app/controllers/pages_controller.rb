class PagesController < ApplicationController
  def home
    @photos = Photo.for_home.with_attached_image.shuffle
  end

  def informations; end
end
