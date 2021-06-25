ActiveAdmin.register_page "Photo batch" do

  page_action :add_batch, method: :post do

    if params[:photos][:photos].nil?
      flash[:error] = "Vous n'avez ajouté aucune photo"
      redirect_to admin_photo_batch_path "photo_batch" and return
    end

    if params[:photos][:category].empty?
      flash[:error] = "Vous n'avez pas spécifié de catégorie"
      redirect_to admin_photo_batch_path "photo_batch" and return
    end

    @category = Category.find(params[:photos][:category])
    @main_category = @category.main_category
    @photos = params[:photos][:photos]

    @photos.each do |photo|
      Photo.create!(image: photo, category: @category, main_category: @main_category)
    end

    redirect_to admin_dashboard_path, notice: "Vos #{@photos.count} photos ont été ajoutées à la catégorie #{@category.title}"
  end

  action_item :add do
    link_to "Add Event", admin_photo_batch_add_batch_path, method: :post
  end

  content do
    panel "Upload batch of photos" do
      render partial: "photo_batch"
    end
  end
end
