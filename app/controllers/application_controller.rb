class ApplicationController < ActionController::Base
  # before_action :set_return_path
  # before_action :set_back_url

  # def set_back_url
  #   # binding.pry
  #   # @back_url = URI(request.referer || '').path

  #   puts "\n\n\n\n#{@back_url}\n\n\n\n"
  # end

  private

  # def set_return_path
  #   @return_path = '/'
  #   @back_url = '/'
  # end
end
