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
  end

  def current
    respond_to do |format|
      format.html { redirect_to current_user }
      format.json do
        @user = current_user
        @omms = current_user.omms.paginate(page: params[:page])
        render 'show'
      end
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
