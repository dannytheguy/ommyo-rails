class MessagesController < ApplicationController
  respond_to :html, :json

  def create
    @omm = Omm.find message_params[:omm_id]
    @omm.messages.build message_params.merge(author_id: @omm.user_id, author_type: 'User')
    @omm.save if @omm.user == current_user
    respond_with(@omm)
  end

  private
    def message_params
      params.require(:message).permit(:omm_id, :text, :recaptcha_challenge_field, :recaptcha_response_field)
    end
end
