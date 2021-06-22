ActiveAdmin.register Category do
  menu priority: 30, label: 'Categories'

  permit_params :title, :parent_category_id
end

