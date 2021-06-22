ActiveAdmin.register MainCategory do
  menu priority: 20, label: 'Main Categories'

  permit_params :title
end
