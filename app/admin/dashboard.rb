ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: 'Dashboard'

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        MainCategory.all.each do |par_cat|
          panel par_cat.title do
            par_cat.categories.each do |cat|
              panel cat.title do
                div style: 'display: flex; flex-wrap: wrap;' do
                  cat.photos.map do |photo|
                    div do
                      link_to admin_photo_path(photo) do
                        cl_image_tag photo.image.key, height: 100, crop: :fill
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
