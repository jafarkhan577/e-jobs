ActiveAdmin.register Job do
  permit_params :title, :company_id, :description, :location, :salary

  index do
    selectable_column
    id_column
    column :title
    column :company
    column :location
    column :salary
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :company
      f.input :description
      f.input :location
      f.input :salary
    end
    f.actions
  end
end
