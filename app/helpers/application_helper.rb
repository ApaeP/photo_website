module ApplicationHelper
  def stimulus_link_to(attr = {}, &block)
    attr[:class] = "cursor-pointer #{attr[:class]}"
    if block_given?
      content_tag(
        :div,
        class: attr[:class],
        data: {
          action: "click->navigation#visit",
          navigation_target: 'links',
          url: attr[:url]
        },
        &block
      )
    else
      content_tag(
        :span,
        attr[:str],
        class: attr[:class],
        data: {
          action: "click->navigation#visit",
          navigation_target: 'links',
          url: attr[:url]
        }
      )
    end
  end
end
