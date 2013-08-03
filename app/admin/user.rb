ActiveAdmin.register User do
  index do
    selectable_column
    id_column
    column :email
    column :created_at
    column :updated_at
    default_actions
  end

  filter :email

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
  controller do
    def permitted_params
      params.permit user: [:email, :password, :password_confirmation]
    end
  end
end
