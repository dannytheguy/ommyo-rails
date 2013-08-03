ActiveAdmin.register Omm do
  actions :index, :show

  controller do
    def permitted_params
      params.permit omm: [:body, :user_id, :brand_id]
    end
  end
end
