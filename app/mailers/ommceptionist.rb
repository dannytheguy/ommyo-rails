class Ommceptionist
  def self.process(email)
    meaningful_recipient = email.to.find { |recipient| recipient[:host] == 'mailer.ommyo.com' }
    brand, omm = EmailIdentifier.disassemble meaningful_recipient[:token]

    if brand && omm
      omm.assign_attributes brand_email: email.from, brand_messageid: email.headers['Message-Id']
      omm.messages.build author_id: brand.id, author_type: 'Brand', text: email.body
      omm.save
    end
  end
end
