class OmmCourier < ActiveRecord::Observer
  observe :message

  def after_save(message)
    if message.omm.brand.email.present?
      MessageMailer.message_email(message.omm.brand, message).deliver
    end

    if message.omm.brand.iim.present?
      Romeo.new.message_imacro(message.omm.brand, message).deliver
    end
  end
end
