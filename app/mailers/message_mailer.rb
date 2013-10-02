class MessageMailer < ActionMailer::Base
  def outgoing_message(brand, message)
    @brand = brand
    @message = message

    mail(from: "OmmYo! <#{ EmailIdentifier.assemble(@brand, @message) }>",
         to: "#{@brand.name} <#{@message.omm.brand_email or @brand.email}>",
         subject: "You've been Omm'd! (##{ @brand.omms.reverse.index(@message.omm)+1 })")
  end
end
