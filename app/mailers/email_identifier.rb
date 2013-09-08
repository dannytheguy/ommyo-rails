module EmailIdentifier
  MESSAGE_ENCRYPTOR = ActiveSupport::MessageEncryptor.new OmmYo::Application.config.secret_key_base

  module_function

  def assemble(brand, message)
    local_part = MESSAGE_ENCRYPTOR.encrypt "#{brand.id}_#{message.omm.id}"
    return "#{local_part}@mailer.ommyo.com"
  end

  def disassemble(address)
    return MESSAGE_ENCRYPTOR.decrypt address
  end
end
