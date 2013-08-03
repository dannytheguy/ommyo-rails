ActiveAdmin.register User do
  actions :index, :show, :edit, :update, :destroy

  controller do
    def permitted_params
      params.permit user: [:email]
    end
  end
end
