module ApplicationHelper
  def stimulus_link(url, css_classes: "", &block)
    # content_tag(:link, href: url, rel: 'preload')
    content_tag(
      :div,
      class: css_classes.concat(' cursor-pointer'),
      data: {
        action: "click->navigation#visit",
        url: url},
      &block
    )
  end
end
