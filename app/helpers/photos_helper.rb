module PhotosHelper
  def custom_cl_image_tag(key, **kwargs)
    "key: #{key}\nkwargs: #{kwargs}"
    kwargs[:class].concat(" #{kwargs.delete(:cover) ? 'object-cover' : 'object-contain'}")

    cl_image_tag(key, kwargs)
  end
end
