ActiveAdmin.register Brand do
  index do
    selectable_column
    id_column
    column :logo do |brand| link_to(image_tag(brand.logo.url(:w88h88)), admin_brand_path(brand)) end
    column :name
    column :email
    column :iim do |brand| brand.iim.present?.to_s.titlecase end
    column :created_at
    column :updated_at
    column :hidden do |brand| check_box_tag(nil, nil, brand.hidden?, disabled: true, id: nil) end
    column :disabled do |brand| check_box_tag(nil, nil, brand.disabled?, disabled: true, id: nil) end
    default_actions
  end

  form html: { enctype: "multipart/form-data" } do |f|
    f.inputs "Brand Details" do
      f.input :name
      f.input :logo, as: :file, hint: f.template.image_tag(f.object.logo.url(:w88h88))
      f.input :email
      f.input :iim, as: :file, hint: f.template.text_area_tag(nil, f.object.iim, id: nil,
                                                              rows: f.object.iim.to_s.lines.count+1, disabled: true)
      f.input :terms, placeholder: 'Please place each term on a separate line in this textbox; no other separator neccesary (or desired).',
                      input_html: { style: 'width: 125px; height:: 200px' }
      f.input :recaptcha_public_key
      f.input :hidden, as: :boolean
      f.input :disabled, as: :boolean
    end
    f.actions
  end

  show do |s|
    attributes_table do
      row :id
      row :name
      row :logo do image_tag(s.logo.url(:w88h88)) end
      row :created_at
      row :updated_at
      row :recaptcha_public_key
      row :email
      row :iim do
        if s.iim.present?
          content_tag 'form', text_area_tag(nil, s.iim, id: nil, rows: s.iim.to_s.lines.count+1, disabled: true)
        else
          span I18n.t('active_admin.empty'), :class => "empty"
        end
      end
      row :terms do
        if s.terms.present?
          s.terms_array.each do |term|
            span term, style: 'padding: 5px; font-weight: bold; color: #ffffff; border-radius: 3px; background-color: #5bc0de'
          end
        else
          span I18n.t('active_admin.empty'), :class => "empty"
        end
      end
      row :hidden do check_box_tag nil, nil, s.hidden?, disabled: true, id: nil end
      row :disabled do check_box_tag nil, nil, s.disabled?, disabled: true, id: nil end
    end
  end

  controller do
    def permitted_params
      params.permit brand: [:name, :recaptcha_public_key, :logo, :email, :iim, :terms, :hidden, :disabled]
    end
  end
end
