ActiveAdmin.routes(self)
ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :role

  index do
    selectable_column
    id_column
    column :email
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role, as: :select, collection: %w[admin user], include_blank: false
    end
    f.actions
  end
end
