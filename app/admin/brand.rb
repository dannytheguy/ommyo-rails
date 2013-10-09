ActiveAdmin.register Brand do
  index do
    selectable_column
    id_column
    column :logo do |brand|
      link_to(image_tag(brand.logo.url(:w88h88)), admin_brand_path(brand))
    end
    column :name
    column :email
    column :iim do |brand|
      brand.iim.present?.to_s.titlecase
    end
    column :created_at
    column :updated_at
    default_actions
  end

  form html: { enctype: "multipart/form-data" } do |f|
    f.inputs "Brand Details" do
      f.input :name
      f.input :email
      f.input :iim, as: :file, hint: f.template.text_area_tag(nil, f.object.iim, id: nil, rows: f.object.iim.to_s.lines.count+1, disabled: true)
      f.input :recaptcha_public_key
      f.input :logo, as: :file, hint: f.template.image_tag(f.object.logo.url(:w88h88))
    end
    f.actions
  end

  show do |s|
    attributes_table do
      row :id
      row :name
      row :logo do
        image_tag(s.logo.url(:w88h88))
      end
      row :created_at
      row :updated_at
      row :recaptcha_public_key
      row :email
      row :iim do
        content_tag 'form', text_area_tag(nil, s.iim, id: nil, rows: s.iim.to_s.lines.count+1, disabled: true)
      end
    end
  end

  controller do
    def permitted_params
      params.permit brand: [:name, :recaptcha_public_key, :logo, :email, :iim]
    end
  end
end
