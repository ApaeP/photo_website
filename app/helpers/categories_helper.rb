module CategoriesHelper
  def show_url
    Rails.application.routes.url_helpers.send("#{self.class.to_s.underscore}_path", self)
  end

  def random_pics(n = 10)
    Photo.where("#{self.class.to_s.underscore}_id" => self).to_a.shuffle.sample(n)
  end
end
