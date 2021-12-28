ActiveAdmin.register Photo do
  reorderable
  menu priority: 40, label: 'Photos'

  filter :main_category_id, as: :check_boxes, collection: MainCategory.all
  filter :category_id, as: :check_boxes, collection: Category.all

  batch_action :tag_for_menu, priority: 10 do |ids|
    batch_action_collection.find(ids).each { |photo| photo.update(menu: true) }
    redirect_to collection_path, alert: "Des photos ont été taggées afin d'être utilisées sur le menu de leurs catégories"
  end

  batch_action :untag_for_menu, priority: 20 do |ids|
    batch_action_collection.find(ids).each { |photo| photo.update(menu: false) }
    redirect_to collection_path, alert: "Des photos ont été détaggées afin de ne plus être utilisées sur le menu de leurs catégories"
  end

  batch_action :tag_for_home, priority: 30 do |ids|
    batch_action_collection.find(ids).each { |photo| photo.update(home: true) }
    redirect_to collection_path, alert: "Des photos ont été taggées afin d'être utilisées sur la page d'accueil"
  end

  batch_action :untag_for_home, priority: 40 do |ids|
    batch_action_collection.find(ids).each { |photo| photo.update(home: false) }
    redirect_to collection_path, alert: "Des photos ont été détaggées afin ne plus être utilisées sur la page d'accueil"
  end

  batch_action :tag_for_home_and_menu, priority: 50 do |ids|
    batch_action_collection.find(ids).each { |photo| photo.update(home: true, menu: true) }
    redirect_to collection_path, alert: "Des photos ont été taggées afin d'être utilisées sur la page d'accueil & sur le menu de leurs catégories"
  end

  batch_action :untag_for_home_and_menu, priority: 60 do |ids|
    batch_action_collection.find(ids).each { |photo| photo.update(home: false, menu: false) }
    redirect_to collection_path, alert: "Des photos ont été détaggées afin de ne plus être utilisées sur la page d'accueil & sur le menu de leurs catégories"
  end

  batch_action :cover_for_home_and_menu, priority: 70 do |ids|
    batch_action_collection.find(ids).each { |photo| photo.update(cover_home: true) }
    redirect_to collection_path, alert: "Les photos séléctionnées couvreront le menu de la page d'accueil"
  end

  batch_action :uncover_for_home_and_menu, priority: 80 do |ids|
    batch_action_collection.find(ids).each { |photo| photo.update(cover_home: false) }
    redirect_to collection_path, alert: "Les photos séléctionnées ne couvreront pas le menu de la page d'accueil"
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
    column :main_category
    column :category
    column :description
    column :home
    column :cover_home
    column :menu
    column :contain_menu
    column :menu_position
    actions
  end

  show do
    attributes_table do
      row :name
      row :main_category
      row :category
      row :description
      row :home
      row :cover_home
      row :menu
      row :contain_menu
      row :menu_position
      row :photo do
        cl_image_tag(resource.image.key, height: '300', crop: :fill) if resource.image.attached?
      end
    end
  end

  form do |f|
    f.inputs do
      div style: 'display: flex; justify-content: center;' do
        cl_image_tag(resource.image.key, height: '300', crop: :fill) if resource.image.attached?
      end
      f.input :name
      f.input :description
      f.input :home
      f.input :cover_home
      f.input :menu
      f.input :contain_menu
      f.input :menu_position
      f.input :category_id, as: :radio, collection: Category.all
      f.input :image, as: :file
    end
    f.actions
  end

  permit_params :name,
                :description,
                :category_id,
                :main_category_id,
                :image,
                :home,
                :cover_home,
                :contain_menu,
                :menu,
                :menu_position
end
