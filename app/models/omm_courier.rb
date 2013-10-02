class OmmCourier < ActiveRecord::Observer
  observe :message

  def after_save(message)
    if message.author_type == 'User'
      if message.omm.brand.email.present?
        MessageMailer.initial_message(message.omm.brand, message).deliver
      end

      if message.omm.brand.iim.present?
        Romeo.new.initial_message(message.omm.brand, message).deliver
      end
    end
  end
end
