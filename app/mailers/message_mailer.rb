class MessageMailer < ActionMailer::Base
  def outgoing_message(brand, message)
    @brand = brand
    @message = message

    mail to:      "#{@brand.name} <#{@message.omm.brand_email or @brand.email}>",
         from:    "OmmYo! <#{ EmailIdentifier.assemble(@brand, @message) }>",
         subject: "You've been Omm'd! (##{ @brand.omms.reverse.index(@message.omm)+1 })"

    if @message.omm.brand_messageid
      headers['In-Reply-To'] = @message.omm.brand_messageid
    end
  end
end
