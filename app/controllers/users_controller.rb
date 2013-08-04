class UsersController < ApplicationController
  respond_to :html, :json

  layout 'member'

  before_action :set_user, only: [:show]

  def show
    @omms = @user.omms.paginate(page: params[:page])
    if current_user == @user
      @omm = Omm.new
      @omm.messages.build
    end
    respond_with(@user)
  end

  def current
    redirect_to current_user
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
