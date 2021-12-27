class ApplicationController < ActionController::Base
  before_action :set_navbar_variables

  private

  def set_navbar_variables
    @main_categories = MainCategory.all.includes(:categories)
  end
end
