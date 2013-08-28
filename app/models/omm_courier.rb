class OmmCourier < ActiveRecord::Observer
  observe :message

  def after_save(message)
    if message.brand.email
      MessageMailer.message_email(message.brand, message).deliver
    end

    if message.brand.iim
    end
  end
end
