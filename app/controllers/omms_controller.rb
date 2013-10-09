class OmmsController < ApplicationController
  respond_to :html, :json

  layout 'member'

  before_action :set_omm, only: [:show]

  def index
    @omms = Omm.all
    @omm = Omm.new
    @omm.messages.build
    respond_with(@omms)
  end

  def show
    render template: 'errors/forbidden', status: :forbidden and return if @omm.user != current_user
    @omm.update_attributes unread: false if @omm.unread?
    @messages = @omm.messages.paginate(page: params[:page])
    if current_user == @omm.user
      @message = @omm.messages.build
    end
    respond_with(@omm)
  end

  def new
    @omm = Omm.new
    @omm.messages.build
    respond_with(@omm)
  end

  def create
    params['omm']['brand_id'] = params['omm']['brand_id'].first
    @omm = current_user.omms.build omm_params
    @omm.messages.build message_params.merge(author_id: @omm.user_id, author_type: 'User')
    @omm.save
    respond_with(@omm)
  end

  private
    def set_omm
      @omm = Omm.find(params[:id])
    end

    def omm_params
      params.require(:omm).permit(:brand_id)
    end

    def message_params
      params.require(:message).permit(:text, :recaptcha_challenge_field, :recaptcha_response_field)
    end
end
