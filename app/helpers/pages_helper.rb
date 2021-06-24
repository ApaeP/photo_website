module PagesHelper
  def fade_out_link(url, css_classes: "", &block)
    content_tag(
      :div,
      class: css_classes.concat(' cursor-pointer'),
        data: {
          action: "click->page-animation#fadeOut",
          url: url},
          &block
    )
  end
end
