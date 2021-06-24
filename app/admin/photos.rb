ActiveAdmin.register Photo do
  menu priority: 40, label: 'Photos'

  filter :main_category_id, as: :check_boxes, collection: MainCategory.all
  filter :category_id, as: :check_boxes, collection: Category.all

  batch_action :tag_for_home_and_menu do |ids|
    batch_action_collection.find(ids).each { |photo| photo.update(home: true, menu: true) }
    redirect_to collection_path, alert: "Des photos ont été taggées afin d'être utilisées sur la page d'accueil & sur le menu de leurs catégories"
  end

  batch_action :untag_for_home_and_menu do |ids|
    batch_action_collection.find(ids).each { |photo| photo.update(home: false, menu: false) }
    redirect_to collection_path, alert: "Des photos ont été détaggées afin de ne plus être utilisées sur la page d'accueil & sur le menu de leurs catégories"
  end

  batch_action :tag_for_home do |ids|
    batch_action_collection.find(ids).each { |photo| photo.update(home: true) }
    redirect_to collection_path, alert: "Des photos ont été taggées afin d'être utilisées sur la page d'accueil"
  end

  batch_action :untag_for_home do |ids|
    batch_action_collection.find(ids).each { |photo| photo.update(home: false) }
    redirect_to collection_path, alert: "Des photos ont été détaggées afin ne plus être utilisées sur la page d'accueil"
  end

  batch_action :tag_for_menu do |ids|
    batch_action_collection.find(ids).each { |photo| photo.update(menu: true) }
    redirect_to collection_path, alert: "Des photos ont été taggées afin d'être utilisées sur le menu de leurs catégories"
  end

  batch_action :untag_for_menu do |ids|
    batch_action_collection.find(ids).each { |photo| photo.update(menu: false) }
    redirect_to collection_path, alert: "Des photos ont été détaggées afin de ne plus être utilisées sur le menu de leurs catégories"
  end

  controller do
    def create
      params[:photo][:main_category_id] = Category.find(params[:photo][:category_id]).main_category.id
      save_resource(build_resource)
      redirect_to admin_photos_path
    end
  end

  index do
    selectable_column
    column :photo do |resource|
      cl_image_tag(resource.image.key, height: '50', crop: :fill) if resource.image.attached?
    end
    column :name
    column :home
    column :menu
    column :main_category
    column :category
    column :description
    actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :main_category
      row :category
      row :home
      row :menu
      row :photo do
        cl_image_tag(resource.image.key, height: '300', crop: :fill) if resource.image.attached?
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :home
      f.input :menu
      f.input :category_id, as: :radio, collection: Category.all
      f.input :image, as: :file
      div do
      end
    end
    f.actions
  end

  permit_params :name,
                :description,
                :category_id,
                :main_category_id,
                :image,
                :home,
                :menu
end
