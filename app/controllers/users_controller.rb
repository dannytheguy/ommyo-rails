class UsersController < ApplicationController
  respond_to :html, :json

  layout 'member'

  before_action :set_user, only: [:show]

  def show
    respond_with(@user)
  end

  def current
    respond_with(current_user)
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
