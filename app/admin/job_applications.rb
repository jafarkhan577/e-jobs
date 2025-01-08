ActiveAdmin.register Application do
  permit_params :applicant_name, :cover_letter, :job_id

  index do
    selectable_column
    column :applicant_name
    column :cover_letter
    column :job
    actions
  end

  show do
    attributes_table do
      row :applicant_name
      row :cover_letter
      row :job
    end
  end
end
