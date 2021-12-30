module ApplicationHelper
  RECAPTCHA_SITE_KEY = ENV['RECAPTCHA_SITE_KEY']

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

  def recaptcha_execute(action)
    id = "recaptcha_token_#{SecureRandom.hex(10)}"

    raw %Q{
      <input name="recaptcha_token" type="hidden" id="#{id}"/>
      <script>
        grecaptcha.ready(function() {
          grecaptcha.execute('#{RECAPTCHA_SITE_KEY}', {action: '#{action}'}).then(function(token) {
            document.getElementById("#{id}").value = token;
          });
        });
      </script>
    }
  end
end
