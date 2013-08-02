class UsersController < ApplicationController
  respond_to :html, :json

  before_action :set_user, only: [:show]

  def show
    respond_with(@user)
  end

  private
    def set_user
      if params[:id] == 'current'
        @user = current_user
      else
        @user = User.find(params[:id])
      end
    end
end
