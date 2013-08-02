class Admin::BaseController < ApplicationController
  prepend_before_action :authenticate_user!, :admin_check

  private
    def admin_check
      if current_user.admin
        return
      else
        redirect_to current_user
      end
    end
end
