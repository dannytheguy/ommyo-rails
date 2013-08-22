ActiveAdmin.register Brand do
  index do
    selectable_column
    id_column
    column :logo do |brand|
      link_to(image_tag(brand.logo.url(:w88h88)), admin_brand_path(brand))
    end
    column :name
    column :created_at
    column :updated_at
    default_actions
  end

  form html: { enctype: "multipart/form-data" } do |f|
    f.inputs "Brand Details" do
      f.input :name
      f.input :recaptcha_public_key
      f.input :logo, as: :file, hint: f.template.image_tag(f.object.logo.url(:w88h88))
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit brand: [:name, :recaptcha_public_key, :logo]
    end
  end
end
