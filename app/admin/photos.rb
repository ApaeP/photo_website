ActiveAdmin.register Photo do
  menu priority: 40, label: 'Photos'

  filter :main_category_id, as: :check_boxes, collection: MainCategory.all
  filter :category_id, as: :check_boxes, collection: Category.all

  controller do
    def create
      params[:photo][:main_category_id] = Category.find(params[:photo][:category_id]).main_category.id
      save_resource(build_resource)
      redirect_to admin_photos_path
    end
  end

  show do
    attributes_table do
      row :name
      row :description
      row :main_category
      row :category
      row :photo do
        cl_image_tag(resource.image.key, height: '300', crop: :fill) if resource.image.attached?
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :category_id, as: :radio, collection: Category.all
      f.input :image, as: :file
      div do
      end
    end
    f.actions
  end

  permit_params :name, :description, :category_id, :main_category_id, :image
end