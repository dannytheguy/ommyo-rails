class IimTestController < ApplicationController
  skip_before_action :authenticate_user!

  respond_to :html

  def get
  end

  def post
    ActionMailer::Base.mail(from: 'drew@ommyo.com',
                            to: params[:email],
                            body: params[:text].reverse).deliver if params[:email].end_with? '@mailer.ommyo.com'
    head :ok
  end
end
