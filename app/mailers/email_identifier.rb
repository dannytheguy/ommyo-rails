module EmailIdentifier
  KEY = 456

  module_function

  def assemble(brand, message)
    token = "#{brand.id+KEY}_#{message.omm.id+KEY}"

    return "#{token}@mailer.ommyo.com"
  end

  def disassemble(token)
    brand_id, omm_id = token.split('_')
    brand_id = brand_id.to_i - KEY
    omm_id = omm_id.to_i - KEY

    brand = Brand.find_by_id brand_id
    omm = Omm.find_by_id omm_id

    return brand, omm
  end
end
