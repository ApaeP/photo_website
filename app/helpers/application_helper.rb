module ApplicationHelper
  def stimulus_link_to(url, css_classes: "", &block)
    content_tag(
      :div,
      class: css_classes.concat(' cursor-pointer'),
      data: {
        action: "click->navigation#visit",
        'navigation-target' => 'links',
        url: url},
      &block
    )
  end
end
