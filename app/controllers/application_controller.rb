class ApplicationController < ActionController::Base
  before_action :set_back_url

  def set_back_url
    @back_url = URI(request.referer || '').path
  end
end
