ActiveAdmin.register Brand do
  controller do
    def permitted_params
      params.permit brand: [:name]
    end
  end
end
