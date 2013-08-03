ActiveAdmin.register Brand do
  controller do
    def permitted_params
      params.permit brand: [:name, :recaptcha_public_key]
    end
  end
end
