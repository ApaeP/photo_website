ActiveAdmin.register Category do
  reorderable
  config.paginate   = false
  menu priority: 30, label: 'Categories'

  show do
    attributes_table do
      row :main_category
      row :title
    end
    reorderable_table_for resource.photos do
      column(:photo) do |photo|
        cl_image_tag(photo.image.key, crop: :fill, style: 'object-fit: contain; max-width: 100%; height: 30px;') if photo.image.attached?
      end
      column :name
      column :description do |desc|
        span desc.description, style: 'max-width: 500px; display: block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;'
      end
    end
  end
  permit_params :title, :parent_category_id
end

