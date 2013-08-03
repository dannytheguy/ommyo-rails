class OmmsController < ApplicationController
  respond_to :html, :json

  before_action :set_omm, only: [:show]

  def show
    respond_with(@omm)
  end

  def new
    @omm = Omm.new
    respond_with(@omm)
  end

  def create
    @omm = Omm.new(omm_params)

    if @omm.save
      respond_with(@omm)
    else
      respond_with(@omm.errors)
    end
  end

  private
    def set_omm
      @omm = Omm.find(params[:id])
    end

    def omm_params
      params.require(:omm).permit(:body)
    end
end
