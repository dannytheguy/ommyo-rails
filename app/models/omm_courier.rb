class OmmCourier < ActiveRecord::Observer
  observe :message

  def after_save(message)
    if message.author_type == 'User'
      if message.omm.brand_email.present? || message.omm.brand.email.present?
        MessageMailer.outgoing_message(message.omm.brand, message).deliver
      end

      if message.omm.brand.iim.present?
        Romeo.new.outgoing_message(message.omm.brand, message).deliver
      end
    end
  end
end
