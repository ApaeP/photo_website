class ApplicationController < ActionController::Base
  before_action :set_navbar_variables

  private

  def verify_recaptcha?(token, recaptcha_action)
    secret_key = ENV['RECAPTCHA_SECRET_KEY']

    uri = URI.parse("https://www.google.com/recaptcha/api/siteverify?secret=#{secret_key}&response=#{token}")
    response = Net::HTTP.get_response(uri)
    json = JSON.parse(response.body)
    json['success'] && json['score'] > 0.5 && json['action'] == recaptcha_action
  end

  def set_navbar_variables
    @main_categories = MainCategory.all.includes(:categories)
    @contact = Contact.new
  end
end
