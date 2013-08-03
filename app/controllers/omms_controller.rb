class OmmsController < ApplicationController
  respond_to :html, :json

  before_action :set_omm, only: [:show]

  def index
    @omms = Omm.all
    respond_with(@omms)
  end

  def show
    respond_with(@omm)
  end

  def new
    @omm = Omm.new
    respond_with(@omm)
  end

  def create
    @omm = current_user.omms.build(omm_params)
    @omm.save
    respond_with(@omm)
  end

  private
    def set_omm
      @omm = Omm.find(params[:id])
    end

    def omm_params
      params.require(:omm).permit(:body, :brand_id, :recaptcha_challenge_field, :recaptcha_response_field)
    end
end
