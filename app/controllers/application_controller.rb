class ApplicationController < ActionController::Base
  before_action :set_navbar_variables
  # layout false#, only: [:method_name]
  # before_action :set_back_url

  # def set_back_url
  #   # binding.pry
  #   # @back_url = URI(request.referer || '').path

  #   puts "\n\n\n\n#{@back_url}\n\n\n\n"
  # end

  private

  def set_navbar_variables
    @main_categories = MainCategory.all.includes(:categories)
  end
end
